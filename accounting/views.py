
from django.shortcuts import render
from django.db.models import Sum
from .models import Supplier, Expense
import pprint

# Create your views here.
def home(request):

    results = (
        Expense.objects.values("supplier")
        .order_by("supplier")
        .annotate(total_amount=Sum("amount"))
    )

    for result in results:
        print(Supplier.objects.get(pk=result['supplier']).name, result['total_amount'])

    return render(request, "accounting/home.html")
