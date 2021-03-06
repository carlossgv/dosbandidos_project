import datetime
import os
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render

from accounting.decorators import admins_only, managers_only
from accounting.utils.utils_api_clover import daily_cash_data_clover
from accounting.utils.utils_incomes import save_income_and_metrics
from users.models import Profile
from .forms import (
    CreateCashLogForm,
    CreateExpenseForm,
    ExpensesForm,
    EditExpensesForm,
    LoadExpensesForm,
    LoadIncomesForm,
    EditCashLogForm,
    ViewCashLogForm,
)
from .models import CashLog, Restaurant, Supplier, Expense
from accounting.utils.utils import (
    get_cash_report,
    get_expenses_by_supplier,
    get_expenses_by_supplier_type,
    get_financials_report,
    get_goals_report,
    get_incomes,
)
from accounting.utils.utils_csv_handling import load_csv_expenses, load_csv_incomes
from dosbandidos_project.settings import BASE_DIR
from accounting.utils.utils_edit_expenses import get_expenses_by_date


@managers_only
@login_required
def create_expense(request):
    form = CreateExpenseForm(request.POST or None)
    message: str = ""
    expense = False
    user = request.user

    form.fields["restaurant"].choices = [(None, "-----")]

    restaurant_options = Profile.objects.get(user_id=user.pk).restaurant.all()
    for restaurant in restaurant_options:
        form.fields["restaurant"].choices.append((restaurant.pk, restaurant.name))

    if request.method == "POST":
        if form.is_valid():
            data = form.cleaned_data

            expense = Expense.objects.create(
                restaurant=Restaurant.objects.get(pk=data["restaurant"]),
                supplier=Supplier.objects.get(pk=data["supplier"]),
                date=data["date"],
                amount=data["amount"],
                cost_center="cash",
                reference=data["reference"],
                comments=data["comments"],
                created_by=user,
            )

            message = "Expense created successfully"

        else:
            message = "Error creating expense"

    return render(
        request,
        "accounting/create-expense.html",
        {"form": form, "message": message, "expense": expense},
    )


@managers_only
@login_required
def create_daily_cash_log(request):
    form = CreateCashLogForm(request.POST or None)
    review_form = ViewCashLogForm(request.POST or None)
    message: str = ""
    cash_log = False
    clover_cash_log = False
    user = request.user

    form.fields["restaurant"].choices = [(None, "-----")]
    review_form.fields["restaurant"].choices = [(None, "-----")]

    restaurant_options = Profile.objects.get(user_id=user.pk).restaurant.all()
    for restaurant in restaurant_options:
        form.fields["restaurant"].choices.append((restaurant.pk, restaurant.name))
        review_form.fields["restaurant"].choices.append(
            (restaurant.pk, restaurant.name)
        )

    if request.method == "POST":

        try:
            request.POST["review-cash-log"]
        except:
            pass
        else:
            if review_form.is_valid():
                data = review_form.cleaned_data
                try:
                    cash_log = CashLog.objects.get(
                        restaurant_id=data["restaurant"], date=data["date"]
                    )

                    expenses = Expense.objects.filter(
                        date=data["date"],
                        cost_center="cash",
                        restaurant_id=data["restaurant"],
                    )
                    cash_log.expenses = expenses

                except:
                    message = "No cash log found for this date"
                else:
                    message = f"Cash log for {data['date']}"

                if data["restaurant"] == "2":
                    try:
                        clover_data = daily_cash_data_clover(
                            os.environ.get("BA_CLOVER_MERCHANT_ID"),
                            data["date"],
                            data["restaurant"],
                        )
                    except:
                        pass
                    else:
                        clover_cash_log = CashLog()
                        clover_cash_log.date = data["date"]
                        clover_cash_log.cash_sales = clover_data["cash_sales"]
                        clover_cash_log.card_auto_grat = clover_data["card_auto_grat"]
                        clover_cash_log.card_tips = clover_data["card_tips"]
                        clover_cash_log.modifications = clover_data["modifications"]

        try:
            request.POST["create-cash-log"]
        except:
            pass
        else:
            if form.is_valid():
                data = form.cleaned_data

                """ check if cash log already exists """
                try:
                    cash_log = CashLog.objects.get(
                        restaurant=data["restaurant"], date=data["date"]
                    )
                    expenses = Expense.objects.filter(
                        date=data["date"],
                        cost_center="cash",
                        restaurant_id=data["restaurant"],
                    )
                    cash_log.expenses = expenses
                except:
                    entry = CashLog.objects.create(
                        date=data["date"],
                        restaurant=Restaurant.objects.get(pk=data["restaurant"]),
                        cash_sales=data["cash_sales"],
                        card_auto_grat=data["card_auto_grat"],
                        card_tips=data["card_tips"],
                        modifications=data["modifications"],
                        comments=data["comments"],
                        createdBy=user,
                    )
                    entry.save()
                    message = "Daily cash log created successfully"
                    cash_log = CashLog.objects.get(
                        restaurant=data["restaurant"], date=data["date"]
                    )
                else:
                    message = f"Cash log for {cash_log.date} already exists"

    return render(
        request,
        "accounting/create-daily-cash-log.html",
        {
            "form": form,
            "review_form": review_form,
            "message": message,
            "cash_log": cash_log,
            "clover_cash_log": clover_cash_log,
        },
    )


@admins_only
@login_required
def cash_log(request):

    edit_form = EditCashLogForm()
    weekly_entries = ""

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
                            date=current_date, restaurant_id=data["restaurant_id"]
                        )
                    else:
                        pass

                    current_date += datetime.timedelta(days=1)

                weekly_entries = CashLog.objects.filter(
                    date__range=[initial_date, final_date],
                    restaurant_id=data["restaurant_id"],
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
                        data[f"{current_entry}-isChecked"]
                    except:
                        setattr(entry, "isChecked", False)
                    else:
                        setattr(entry, "isChecked", True)

                    try:
                        data[f"{current_entry}-wasSent"]
                    except:
                        setattr(entry, "wasSent", False)
                    else:
                        setattr(entry, "wasSent", True)

                    entry.save()

                elif field_counter == 7:
                    continue
                else:
                    field = field.split("-")[1]
                    value = data[f"{entry_id}-{field}"]
                    setattr(entry, field, value)
                    entry.save()

                field_counter += 1

    return render(
        request,
        "accounting/cash-log.html",
        {"editForm": edit_form, "weeklyEntries": weekly_entries},
    )


@admins_only
@login_required
def incomes(request):
    incomes_form = LoadIncomesForm(request.POST or None)
    message: str = ""

    if request.method == "POST":

        if incomes_form.is_valid():
            print("IM VALID")
            data = incomes_form.cleaned_data
            print(data)
            save_income_and_metrics(
                data["restaurant"],
                data["initial_date"],
                data["finish_date"],
                data["net_sales"],
                data["gross_sales"],
                data["liquor_sales"],
                data["order_amount"],
                data["labor"],
            )

            message = f"Income and Metrics Saved for {data['restaurant']} from {data['initial_date']} to {data['finish_date']}"

    return render(
        request,
        "accounting/incomes.html",
        {"incomesForm": incomes_form, "message": message},
    )


@admins_only
@login_required
def edit_expenses(request):
    edit_form = EditExpensesForm(request.POST or None)
    expenses = ""
    load_form = LoadExpensesForm
    user = request.user

    edit_form.fields["restaurant"].choices = [(None, "-----")]

    restaurant_options = Profile.objects.get(user_id=user.pk).restaurant.all()
    for restaurant in restaurant_options:
        edit_form.fields["restaurant"].choices.append((restaurant.pk, restaurant.name))

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
            form = edit_form
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
        },
    )


@login_required
def home(request):
    form = ExpensesForm(request.POST or None)
    user = request.user

    form.fields["restaurant"].choices = [(None, "-----")]

    restaurant_options = Profile.objects.get(user_id=user.pk).restaurant.all()
    for restaurant in restaurant_options:
        form.fields["restaurant"].choices.append((restaurant.pk, restaurant.name))

    if request.method == "POST":

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
        {"form": form},
    )
