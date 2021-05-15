from django.contrib.auth.decorators import login_required
from django.db.models.expressions import F
from django.shortcuts import render
from .forms import ExpensesForm
from .utils import (
    getCashReport,
    getExpensesBySupplier,
    getExpensesBySupplierType,
    getFinancialsReport,
    getGoalsReport,
    getIncomes,
    getMetrics,
)

# Create your views here.
@login_required
def home(request):

    if request.method == "POST":
        form = ExpensesForm(request.POST)
        userId = request.user.pk

        if form.is_valid():
            data = form.cleaned_data
            initialDate = data["initialDate"]
            finishDate = data["finishDate"]

            if "getReport" in request.POST:
                goalsReport = getGoalsReport(initialDate, finishDate, userId)
                food = goalsReport["food"]
                liquor = goalsReport["liquor"]

                incomes = getIncomes(initialDate, finishDate, userId)
                incomesData = incomes["incomes"]
                incomesTotal = incomes["total"]
                lavuSales = incomes["lavuSales"]

                metrics = getMetrics(initialDate, finishDate, userId)

                print(metrics["Lavu Order Count"]["total"])

                if metrics["Lavu Order Count"]["total"] != 0:
                    metrics["orderAvg"] = round(
                        metrics["Lavu Gross Sales"]["total"]
                        / metrics["Lavu Order Count"]["total"],
                        2,
                    )
                    metrics['laborGoal'] = round(metrics['Lavu Labor']['total']/lavuSales * 100)

                    foodCost = food['total']/lavuSales
                else:
                    metrics["orderAvg"] = "No info"
                    metrics['laborGoal'] = "No info"


                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "food": food, "liquor": liquor},
                )

            elif "getFinancials" in request.POST:
                financials = getFinancialsReport(initialDate, finishDate, userId)
                financialsData = financials["results"]
                financialsTotal = financials["total"]

                incomes = getIncomes(initialDate, finishDate, userId)
                incomesData = incomes["incomes"]
                incomesTotal = incomes["total"]

                return render(
                    request,
                    "accounting/home.html",
                    {
                        "form": form,
                        "financialsData": financialsData,
                        "financialsTotal": financialsTotal,
                        "incomesData": incomesData,
                        "incomesTotal": incomesTotal,
                    },
                )
            elif "getCashReport" in request.POST:
                initialCash = data["cash"]
                cashData = getCashReport(initialCash, initialDate, finishDate, userId)

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "cashData": cashData},
                )
            else:
                if data["suppliers"] != "":
                    supplierData = getExpensesBySupplier(
                        data["suppliers"], initialDate, finishDate, userId
                    )

                elif data["supplier_type"] != "":
                    supplierData = getExpensesBySupplierType(
                        data["supplier_type"], initialDate, finishDate, userId
                    )

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "supplierData": supplierData},
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
