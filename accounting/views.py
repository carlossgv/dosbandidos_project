import datetime
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render

from accounting.decorators import admins_only, is_user_admin
from .forms import ExpensesForm, EditExpensesForm, LoadExpensesForm, LoadIncomesForm, EditCashLogForm
from .models import CashLog, Supplier, Expense
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


@admins_only
@login_required
def cash_log(request):
    """
    View for the cash log page.
    """

    edit_form = EditCashLogForm()
    weekly_entries = ""
    is_admin = is_user_admin(request.user)

    if request.method == "POST":

        try:
            request.POST["retrieve-cash-log"]
        except:
            pass
        else:
            edit_form = EditCashLogForm(request.POST)

            if edit_form.is_valid():
                data = edit_form.cleaned_data
                initial_date = data["initial_date"]
                final_date = data["initial_date"] + datetime.timedelta(days=6)

                current_date = initial_date

                while current_date <= final_date:
                    try:
                        entry = CashLog.objects.get(
                            date=current_date, restaurant_id=data["restaurant_id"]
                        )
                    except:
                        CashLog.objects.create(
                            date=current_date, restaurant_id=data["restaurant_id"])
                    else:
                        pass

                    current_date += datetime.timedelta(days=1)

                weekly_entries = CashLog.objects.filter(
                    date__range=[
                        initial_date, final_date], restaurant_id=data["restaurant_id"]
                )

                weekly_entries = weekly_entries.order_by("date")

        try:
            request.POST["update-cash-log"]
        except:
            pass
        else:
            data = request.POST
            current_entry = 0
            field_counter = 0
            for field in data:
                if field == "csrfmiddlewaretoken" or field == "update-cash-log":
                    continue

                entry_id = field.split("-")[0]

                entry = CashLog.objects.get(pk=entry_id)

                if entry_id != current_entry:
                    current_entry = entry_id
                    field_counter = 0

                if field_counter == 6:
                    try:
                        data[f'{current_entry}-isChecked']
                    except:
                        setattr(entry, "isChecked", False)
                    else:
                        setattr(entry, "isChecked", True)

                    try:
                        data[f'{current_entry}-wasSent']
                    except:
                        setattr(entry, "wasSent", False)
                    else:
                        setattr(entry, "wasSent", True)

                    entry.save()

                elif field_counter == 7:
                    continue
                else:
                    field = field.split("-")[1]
                    value = data[f'{entry_id}-{field}']
                    setattr(entry, field, value)
                    entry.save()

                field_counter += 1

    return render(request, "accounting/cash-log.html", {"editForm": edit_form, "weeklyEntries": weekly_entries, "isAdmin": is_admin})


@admins_only
@login_required
def incomes(request):
    load_form = LoadIncomesForm
    is_admin = is_user_admin(request.user)

    if request.method == "POST":
        try:
            request.FILES["file"]
        except:
            pass
        else:
            file = request.FILES["file"]
            fss = FileSystemStorage()
            file = fss.save(file.name, file)

            file_url = str(BASE_DIR) + fss.url(file)
            delimiter = request.POST["delimiter"]
            restaurant_id = request.POST["restaurant"]

            load_csv_incomes(file_url, delimiter, restaurant_id)

    return render(
        request, "accounting/incomes.html", {
            "loadForm": load_form, "isAdmin": is_admin}
    )


@admins_only
@login_required
def edit_expenses(request):
    edit_form = EditExpensesForm
    expenses = ""
    is_admin = is_user_admin(request.user)
    load_form = LoadExpensesForm

    if request.method == "POST":
        try:
            request.FILES["file"]
        except:
            pass
        else:
            file = request.FILES["file"]
            fss = FileSystemStorage()
            file = fss.save(file.name, file)

            file_url = str(BASE_DIR) + fss.url(file)
            delimiter = request.POST["delimiter"]
            cost_center = request.POST["cost_center"]
            restaurant_id = request.POST["restaurant"]

            load_csv_expenses(file_url, delimiter, restaurant_id, cost_center)

        try:
            request.POST["retrieve-expenses"]
        except:
            pass
        else:
            form = ExpensesForm(request.POST)

            if form.is_valid():
                data = form.cleaned_data
                restaurant_id = request.POST["restaurant"]
                initial_date = data["initial_date"]
                finish_date = data["finish_date"]
                supplier = False if data["suppliers"] == "" else data["suppliers"]

                expenses = get_expenses_by_date(
                    initial_date, finish_date, restaurant_id, supplier
                )

        try:
            request.POST["edit-expenses"]
        except:
            pass
        else:
            data = request.POST
            for field in data:
                if field == "csrfmiddlewaretoken" or field == "edit-expenses":
                    continue
                value = data[field]
                expense_id = field.split("-")[0]
                field = field.split("-")[1]
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
        {
            "editForm": edit_form,
            "loadForm": load_form,
            "expenses": expenses,
            "supplier_choices": supplier_choices,
            "cost_center_choices": cost_center_choices,
            "isAdmin": is_admin,
        },
    )


@login_required
def home(request):
    is_admin = is_user_admin(request.user)
    if request.method == "POST":
        form = ExpensesForm(request.POST)

        if form.is_valid():
            data = form.cleaned_data
            initial_date = data["initial_date"]
            finish_date = data["finish_date"]
            restaurant_id = data["restaurant"]

            if "getGoals" in request.POST:

                goals_report_data = get_goals_report(
                    initial_date, finish_date, restaurant_id
                )

                return render(
                    request,
                    "accounting/home.html",
                    {
                        "form": form,
                        "food": goals_report_data["food"],
                        "liquor": goals_report_data["liquor"],
                        "metrics": goals_report_data["metrics"],
                    },
                )

            elif "getFinancials" in request.POST:
                financials = get_financials_report(
                    initial_date, finish_date, restaurant_id
                )
                financials_data = financials["results"]
                financials_total = financials["total"]

                incomes = get_incomes(initial_date, finish_date, restaurant_id)
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
                cash_data = get_cash_report(
                    initial_cash, initial_date, finish_date, restaurant_id
                )

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "cash_data": cash_data},
                )
            else:
                supplier_data = ""
                if data["suppliers"] != "":
                    supplier_data = get_expenses_by_supplier(
                        data["suppliers"], initial_date, finish_date, restaurant_id
                    )

                elif data["supplier_type"] != "":
                    supplier_data = get_expenses_by_supplier_type(
                        data["supplier_type"], initial_date, finish_date, restaurant_id
                    )

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "supplier_data": supplier_data},
                )

        return render(
            request,
            "accounting/home.html",
            {"form": form, "isAdmin": is_admin},
        )

    else:
        form = ExpensesForm

        return render(
            request,
            "accounting/home.html",
            {"form": form, "isAdmin": is_admin},
        )
