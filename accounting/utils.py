from .models import Supplier, Expense
from django.db.models import Sum


def getExpensesBySupplier(supplierId, initialDate, finishDate):
    expenses = Expense.objects.filter(
        supplier=supplierId, date__range=[initialDate, finishDate]
    ).annotate(total_amount=Sum("amount"))

    total = 0

    for expense in expenses:
        # print(expense)
        total += expense.amount

    return {"total": total, "expenses": expenses}


def getExpensesBySupplierType(supplierType, initialDate, finishDate):
    expenses = Expense.objects.filter(
        supplier__supplierType=supplierType, date__range=[initialDate, finishDate]
    ).annotate(total_amount=Sum("amount"))

    total = 0

    for expense in expenses:
        # print(expense)
        total += expense.amount

    return {"total": total, "expenses": expenses}


def goalsReport(initialDate, finishDate):
    def totalizeSuppliers(suppliersList):
        total = 0

        for supplier in suppliersList:
            if supplier["type"] == "supplier":
                supplierData = getExpensesBySupplier(
                    supplier["id"], initialDate, finishDate
                )
                print(supplierData["total"])
                total += supplierData["total"]
            else:
                typeData = getExpensesBySupplierType(
                    supplier["type"], initialDate, finishDate
                )
                print(typeData["total"])
                total += typeData["total"]

        return total

    # SGC (29), Paisa (31), Mil Arcos (30), Sams (32), Walmart (33)
    foodSuppliers = [
        {"id": 29, "type": "supplier"},
        {"id": 31, "type": "supplier"},
        {"id": 30, "type": "supplier"},
        {"id": 32, "type": "supplier"},
        {"id": 33, "type": "supplier"},
        {"type": "foodMisc"},
    ]

    # Jarboe (34), IDF (35), Republic (36), Boardwalk (37), Store (38)
    liquorSuppliers = [
        {"id": 34, "type": "supplier"},
        {"id": 35, "type": "supplier"},
        {"id": 36, "type": "supplier"},
        {"id": 37, "type": "supplier"},
        {"id": 38, "type": "supplier"},
        {"type": "liquorMisc"},
    ]

    print(totalizeSuppliers(foodSuppliers))
    print(totalizeSuppliers(liquorSuppliers))
