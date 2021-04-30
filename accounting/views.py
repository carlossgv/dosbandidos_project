from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .forms import ExpensesForm
from .utils import (
    getCashReport,
    getExpensesBySupplier,
    getExpensesBySupplierType,
    getFinancialsReport,
    getGoalsReport,
)

# Create your views here.
@login_required
def home(request):

    if request.method == "POST":
        form = ExpensesForm(request.POST)

        if form.is_valid():
            data = form.cleaned_data
            initialDate = data["initialDate"]
            finishDate = data["finishDate"]

            if "getReport" in request.POST:
                goalsReport = getGoalsReport(initialDate, finishDate)
                food = goalsReport["food"]
                liquor = goalsReport["liquor"]

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "food": food, "liquor": liquor},
                )

            elif "getFinancials" in request.POST:
                financials = getFinancialsReport(initialDate, finishDate)

                financialsData = financials["results"]
                financialsTotal = financials["total"]

                return render(
                    request,
                    "accounting/home.html",
                    {
                        "form": form,
                        "financialsData": financialsData,
                        "financialsTotal": financialsTotal,
                    },
                )
            elif "getCashReport" in request.POST:
                initialCash = data['cash']
                cashData = getCashReport(initialCash, initialDate,finishDate)

                return render(
                    request,
                    "accounting/home.html",
                    {
                        "form": form,
                        "cashData": cashData
                    },
                )


            else:
                if data["suppliers"] != "":
                    supplierData = getExpensesBySupplier(
                        data["suppliers"], initialDate, finishDate
                    )

                elif data["supplier_type"] != "":
                    supplierData = getExpensesBySupplierType(
                        data["supplier_type"], initialDate, finishDate
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
