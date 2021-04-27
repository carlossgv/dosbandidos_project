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

            if data["suppliers"] != "":
                print(getExpensesBySupplier(data["suppliers"], initialDate, finishDate))
            elif data["supplier_type"] != "":
                print(
                    getExpensesBySupplierType(
                        data["supplier_type"], initialDate, finishDate
                    )
                )
            else:
                goalsReport = getGoalsReport(initialDate, finishDate)
                food = goalsReport["food"]
                liquor = goalsReport["liquor"]

                print(food['suppliersTotals'])

                return render(
                    request,
                    "accounting/home.html",
                    {"form": form, "food": food, "liquor": liquor},
                )
        # return render(
        #     request,
        #     "accounting/home.html",
        #     {"form": form, "foodData": foodData, "liquorData": liquorData},
        #     )

    else:
        form = ExpensesForm

        print(getExpensesBySupplier(29, '2021-04-05', '2021-04-11'))

        return render(
            request,
            "accounting/home.html",
            {"form": form },
        )
