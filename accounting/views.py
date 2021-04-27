from django.http import response
from django.shortcuts import render
from django.db.models import Sum
from .models import Supplier, Expense
from .forms import ExpensesForm
from datetime import datetime

# Create your views here.
def home(request):

    if request.method == "POST":
        form = ExpensesForm(request.POST)

        if form.is_valid():
            data = form.cleaned_data

        results = (
            Expense.objects.values("supplier")
            .filter(date__range=[data["initialDate"], data["finishDate"]])
            .order_by("supplier")
            .annotate(total_amount=Sum("amount"))
        )

        for result in results:
            print(
                Supplier.objects.get(pk=result["supplier"]).name, result["total_amount"]
            )

    else:
        form = ExpensesForm

    return render(request, "accounting/home.html", {"form": form})
