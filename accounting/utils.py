from .models import Supplier, Expense
from django.db.models import Sum, aggregates


def getExpensesBySupplier(supplierId, initialDate, finishDate):
    name = Supplier.objects.get(pk=supplierId).name

    expenses = (
        Expense.objects.filter(
            supplier=supplierId, date__range=[initialDate, finishDate]
        )
        .annotate(total_amount=Sum("amount"))
        .order_by("date")
    )

    total = Expense.objects.filter(
        supplier=supplierId, date__range=[initialDate, finishDate]
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total == None:
        total = 0

    return {"name": name, "total": round(total, 2), "expenses": expenses}


def getExpensesBySupplierType(supplierType, initialDate, finishDate):
    supplierType = Supplier.objects.filter(supplierType=supplierType)[1].supplierType

    expenses = (
        Expense.objects.filter(
            supplier__supplierType=supplierType, date__range=[initialDate, finishDate]
        )
        .annotate(total_amount=Sum("amount"))
        .order_by("date")
    )

    total = Expense.objects.filter(
        supplier__supplierType=supplierType, date__range=[initialDate, finishDate]
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total == None:
        total = 0

    return {"supplierType": supplierType, "total": round(total,2), "expenses": expenses}


def getGoalsReport(initialDate, finishDate):
    def totalizeSuppliers(suppliersList):
        total = 0
        suppliersTotals = []
        for supplier in suppliersList:
            
            if supplier["type"] == "supplier":
                supplierData = getExpensesBySupplier(
                    supplier["id"], initialDate, finishDate
                )
                try:
                    data
                except:
                    data = supplierData["expenses"]
                else:
                    data = data | supplierData["expenses"]

                total += supplierData["total"]
                suppliersTotals.append(
                    {"name": supplierData["name"], "total": supplierData["total"]}
                )
            else:
                typeData = getExpensesBySupplierType(
                    supplier["type"], initialDate, finishDate
                )
                data = data | typeData["expenses"]
                # print(data["total"])
                total += typeData["total"]
                suppliersTotals.append(
                    {"name": typeData["supplierType"], "total": typeData["total"]}
                )

        # print("-------------",data)
        return {"total": total, "data": data, "suppliersTotals": suppliersTotals}

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

    food = totalizeSuppliers(foodSuppliers)
    # print(food["total"])
    liquor = totalizeSuppliers(liquorSuppliers)

    return {"food": food, "liquor": liquor}
