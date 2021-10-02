from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render
from .forms import ExpensesForm, EditExpensesForm, LoadExpensesForm, LoadIncomesForm
from .models import Supplier, Expense
from .utils import (
    get_cash_report,
    get_expenses_by_supplier,
    get_expenses_by_supplier_type,
    get_financials_report,
    get_goals_report,
    get_incomes,
    get_metrics,
)
from .utils_csv_handling import load_csv_expenses, load_csv_incomes
from dosbandidos_project.settings import BASE_DIR
from .utils_edit_expenses import get_expenses_by_date


@login_required
def incomes(request):
    load_form = LoadIncomesForm

    if request.method == 'POST':
        try:
            request.FILES['file']
        except:
            pass
        else:
            file = request.FILES['file']
            fss = FileSystemStorage()
            file = fss.save(file.name, file)

            file_url = str(BASE_DIR) + fss.url(file)
            delimiter = request.POST['delimiter']
            user_id = request.user.pk

            load_csv_incomes(file_url, delimiter, user_id)

    return render(
        request,
        "accounting/incomes.html",
        {"loadForm": load_form},
    )


@login_required
def edit_expenses(request):
    edit_form = EditExpensesForm
    expenses = ""

    load_form = LoadExpensesForm

    if request.method == 'POST':
        try:
            request.FILES['file']
        except:
            pass
        else:
            file = request.FILES['file']
            fss = FileSystemStorage()
            file = fss.save(file.name, file)

            file_url = str(BASE_DIR) + fss.url(file)
            delimiter = request.POST['delimiter']
            cost_center = request.POST['cost_center']
            user_id = request.user.pk

            load_csv_expenses(file_url, delimiter, user_id, cost_center)

        try:
            request.POST['retrieve-expenses']
        except:
            pass
        else:
            form = ExpensesForm(request.POST)

            if form.is_valid():
                data = form.cleaned_data
                user_id = request.user.pk
                initial_date = data['initial_date']
                finish_date = data['finish_date']
                supplier = False if data['suppliers'] == '' else data['suppliers']

                expenses = get_expenses_by_date(initial_date, finish_date, user_id, supplier)

        try:
            request.POST['edit-expenses']
        except:
            pass
        else:
            data = request.POST
            for field in data:
                if field == 'csrfmiddlewaretoken' or field == 'edit-expenses':
                    continue
                value = data[field]
                expense_id = field.split('-')[0]
                field = field.split('-')[1]
                expense = Expense.objects.get(pk=expense_id)
                setattr(expense, field, value)
                expense.save()

    supplier_choices = [(None, "-----")]
    for supplier in Supplier.objects.all().order_by("name"):
        supplier_choices.append((supplier.pk, supplier.name))

    cost_center_choices = (
        (None, "-----"),
        ("cash", "Cash"),
        ("primaryAccount", "Primary Account"),
        ("expensesAccount", "Expenses Account"),
        ("notPaid", "Not Paid"),
        ("standBy", "Standby"),
    )

    return render(
        request,
        "accounting/edit-expenses.html",
        {"editForm": edit_form, "loadForm": load_form, "expenses": expenses,
         "supplier_choices": supplier_choices,
         "cost_center_choices": cost_center_choices},
    )


@login_required
def home(request):
    if request.method == "POST":
        form = ExpensesForm(request.POST)
        user_id = request.user.pk

        if form.is_valid():
            data = form.cleaned_data
            initial_date = data["initial_date"]
            finish_date = data["finish_date"]

            if "getGoals" in request.POST:
                goals_report = get_goals_report(initial_date, finish_date, user_id)
                food = goals_report["food"]
                liquor = goals_report["liquor"]

                incomes = get_incomes(initial_date, finish_date, user_id)
                restaurant_sales = incomes["restaurant_sales"]

                metrics = get_metrics(initial_date, finish_date, user_id)

                if metrics["restaurant_order_count"]["total"] != 0:
                    metrics["order_average"] = {
                        'name': 'Order Average',
                        'total': round(
                            metrics["restaurant_gross_sales"]["total"]
                            / metrics["restaurant_order_count"]["total"],
                            2
                        )
                    }
                    metrics['labor_goal'] = {
                        "name": 'Labor Goal',
                        "total": round(metrics['restaurant_labor']['total'] / restaurant_sales * 100)
                    }

                    food_cost = food['total'] / restaurant_sales
                    metrics['food_cost'] = {
                        'name': 'Food Cost',
                        'total': round(food_cost * 100)
                    }

                    liquor_cost = liquor['total'] / metrics['restaurant_liquor_sales']['total']
                    metrics['liquor_cost'] = {
                        'name': 'Liquor Cost',
                        'total': round(liquor_cost * 100)
                    }

                    cost_average = (metrics['food_cost']['total'] + metrics['liquor_cost']['total']) / 2
                    metrics['cost_average'] = {
                        'name': 'Cost Average',
                        'total': cost_average
                    }

                    metrics['food_net_sales'] = {
                        'name': 'Food Net Sales',
                        'total': metrics['restaurant_net_sales']['total'] - metrics['restaurant_liquor_sales']['total']
                    }

                else:
                    metrics["order_average"] = "No info"
                    metrics['labor_goal'] = "No info"

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "food": food, "liquor": liquor, 'metrics': metrics},
                )

            elif "getFinancials" in request.POST:
                financials = get_financials_report(initial_date, finish_date, user_id)
                financials_data = financials["results"]
                financials_total = financials["total"]

                incomes = get_incomes(initial_date, finish_date, user_id)
                incomes_data = incomes["incomes"]
                incomes_total = incomes["total"]

                return render(
                    request,
                    "accounting/home.html",
                    {
                        "form": form,
                        "financials_data": financials_data,
                        "financials_total": financials_total,
                        "incomes_data": incomes_data,
                        "incomes_total": incomes_total,
                    },
                )
            elif "getCashReport" in request.POST:
                initial_cash = data["cash"]
                cash_data = get_cash_report(initial_cash, initial_date, finish_date, user_id)

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "cash_data": cash_data},
                )
            else:
                supplier_data = ""
                if data["suppliers"] != "":
                    supplier_data = get_expenses_by_supplier(
                        data["suppliers"], initial_date, finish_date, user_id
                    )

                elif data["supplier_type"] != "":
                    supplier_data = get_expenses_by_supplier_type(
                        data["supplier_type"], initial_date, finish_date, user_id
                    )

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "supplier_data": supplier_data},
                )

        return render(
            request,
            "accounting/home.html",
            {"form": form},
        )

    else:
        form = ExpensesForm

        return render(
            request,
            "accounting/home.html",
            {"form": form},
        )
