from django.shortcuts import render
from django.db.models import Sum
from .models import Supplier, Expense
from .forms import ExpensesForm
from .utils import getExpensesBySupplier, getExpensesBySupplierType, getGoalsReport

# Create your views here.
def home(request):

    if request.method == "POST":
        form = ExpensesForm(request.POST)

        if form.is_valid():
            data = form.cleaned_data
            initialDate = data["initialDate"]
            finishDate = data["finishDate"]

            # if request.POST['getReport'] == '':
            if "getReport" in request.POST:
                goalsReport = getGoalsReport(initialDate, finishDate)
                food = goalsReport["food"]
                liquor = goalsReport["liquor"]

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "food": food, "liquor": liquor},
                )
            else:
                if data["suppliers"] != "":
                    supplierData = getExpensesBySupplier(
                        data["suppliers"], initialDate, finishDate
                    )
                    print(
                        getExpensesBySupplier(
                            data["suppliers"], initialDate, finishDate
                        )
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
