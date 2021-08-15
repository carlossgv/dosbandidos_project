from django.contrib.auth.decorators import login_required
from django.db.models.expressions import F
from django.shortcuts import render
from .forms import ExpensesForm, EditExpensesForm
from .utils import (
    getCashReport,
    getExpensesBySupplier,
    getExpensesBySupplierType,
    getFinancialsReport,
    getGoalsReport,
    getIncomes,
    getMetrics,
)


@login_required
def edit_expenses(request):
    form = EditExpensesForm
    return render(
        request,
        "accounting/edit-expenses.html",
        {"form": form},
    )

@login_required
def home(request):

    if request.method == "POST":
        form = ExpensesForm(request.POST)
        userId = request.user.pk

        if form.is_valid():
            data = form.cleaned_data
            initialDate = data["initialDate"]
            finishDate = data["finishDate"]

            if "getGoals" in request.POST:
                goalsReport = getGoalsReport(initialDate, finishDate, userId)
                food = goalsReport["food"]
                liquor = goalsReport["liquor"]

                incomes = getIncomes(initialDate, finishDate, userId)
                incomesData = incomes["incomes"]
                incomesTotal = incomes["total"]
                restaurantSales = incomes["restaurantSales"]

                metrics = getMetrics(initialDate, finishDate, userId)

                if metrics["RestaurantOrderCount"]["total"] != 0:
                    metrics["orderAvg"] = {
                        'name': 'Order Average',
                        'total': round(
                        metrics["RestaurantGrossSales"]["total"]
                        / metrics["RestaurantOrderCount"]["total"],
                        2)
                    }
                    metrics['laborGoal'] = {
                        "name": 'Labor Goal',
                        "total": round(metrics['RestaurantLabor']['total'] / restaurantSales * 100)
                    }

                    foodCost = food['total']/restaurantSales
                    metrics['foodCost'] = {
                        'name': 'Food Cost',
                        'total': round(foodCost*100)
                    }

                    liquorCost = liquor['total']/metrics['RestaurantLiquorSales']['total']
                    metrics['liquorCost'] = {
                        'name': 'Liquor Cost',
                        'total': round(liquorCost*100)
                    }

                    costAvg = (metrics['foodCost']['total'] + metrics['liquorCost']['total'])/2
                    metrics['costAvg'] = {
                        'name': 'Cost Average',
                        'total': costAvg
                    }

                    metrics['FoodNetSales'] = {
                        'name': 'Food Net Sales',
                        'total': metrics['RestaurantNetSales']['total'] - metrics['RestaurantLiquorSales']['total']
                    }

                else:
                    metrics["orderAvg"] = "No info"
                    metrics['laborGoal'] = "No info"

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "food": food, "liquor": liquor, 'metrics': metrics},
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
