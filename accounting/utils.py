from .models import CashLog, Supplier, Expense, Income, Metric
from django.db.models import Sum
from datetime import timedelta
from .utils_api_clover import daily_cash_data_clover


def getExpensesBySupplier(supplierId, initialDate, finishDate, userId):
    name = Supplier.objects.get(pk=supplierId).name

    expenses = (
        Expense.objects.filter(
            supplier=supplierId,
            date__range=[initialDate, finishDate],
            restaurant_id=userId,
        )
        .annotate(total_amount=Sum("amount"))
        .order_by("date")
    )

    total = Expense.objects.filter(
        supplier=supplierId, date__range=[initialDate, finishDate], restaurant_id=userId
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total == None:
        total = 0

    return {"name": name, "total": round(total, 2), "expenses": expenses}


def getIncomeBySupplier(supplierId, initialDate, finishDate, userId):
    name = Supplier.objects.get(pk=supplierId).name

    total = Income.objects.filter(
        supplier=supplierId, date__range=[initialDate, finishDate], restaurant_id=userId
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total == None:
        total = 0

    return {"name": name, "total": round(total, 2)}


def getMetricBySupplier(supplierId, initialDate, finishDate, userId):
    name = Supplier.objects.get(pk=supplierId).name

    total = Metric.objects.filter(
        supplier=supplierId, date__range=[initialDate, finishDate], restaurant_id=userId
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total is None:
        total = 0

    return {"name": name, "total": round(total, 2)}


def getMetrics(initialDate, finishDate, userId):
    metrics_list = Supplier.objects.filter(supplierType="restaurantInfo")
    metrics = {}

    for supplier in metrics_list:
        metricData = getMetricBySupplier(supplier.pk, initialDate, finishDate, userId)
        metrics[''.join(x for x in supplier.name.title() if not x.isspace())] = metricData

    metrics['RestaurantNetSales'] = getIncomeBySupplier(68, initialDate, finishDate,userId)

    return metrics


def getIncomes(initialDate, finishDate, userId):
    supplier_list = Supplier.objects.filter(supplierType="sales")
    incomes = []
    total = 0
    restaurantSales = 0

    for supplier in supplier_list:
        incomeData = getIncomeBySupplier(supplier.pk, initialDate, finishDate, userId)
        incomes.append(incomeData)
        total += incomeData["total"]
        if supplier.name == 'Restaurant Net Sales':
            restaurantSales = incomeData['total']
            # if userId == 1:
            #     restaurantSales = incomeData['total']
            # elif userId == 2:
            #     pass

    return {"incomes": incomes, "total": total, 'restaurantSales': restaurantSales}


def getExpensesBySupplierType(supplierType, initialDate, finishDate, userId):
    supplierType = Supplier.objects.filter(supplierType=supplierType)[1].supplierType

    name = Supplier.objects.filter(supplierType=supplierType)[
        1
    ].get_supplierType_display()

    expenses = (
        Expense.objects.filter(
            supplier__supplierType=supplierType,
            date__range=[initialDate, finishDate],
            restaurant_id=userId,
        )
        .annotate(total_amount=Sum("amount"))
        .order_by("date")
    )

    total = Expense.objects.filter(
        supplier__supplierType=supplierType,
        date__range=[initialDate, finishDate],
        restaurant_id=userId,
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total is None:
        total = 0

    return {
        "name": name,
        "total": round(total, 2),
        "expenses": expenses,
    }


def getGoalsReport(initialDate, finishDate, userId):
    def totalizeSuppliers(suppliersList):
        total = 0
        suppliersTotals = []
        for supplier in suppliersList:

            if supplier["type"] == "supplier":
                supplierData = getExpensesBySupplier(
                    supplier["id"], initialDate, finishDate, userId
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
                    supplier["type"], initialDate, finishDate, userId
                )
                data = data | typeData["expenses"]
                total += typeData["total"]
                suppliersTotals.append(
                    {"name": typeData["name"], "total": typeData["total"]}
                )

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
    liquor = totalizeSuppliers(liquorSuppliers)

    return {"food": food, "liquor": liquor}


def getFinancialsReport(initialDate, finishDate, userId):
    supplier_types = [
        "service",
        "operationFood",
        "foodMisc",
        "operationLiquor",
        "liquorMisc",
        "labor",
        "uncategorized",
    ]

    results = []
    financialsTotal = 0

    for supplier_type in supplier_types:
        name = Supplier.objects.filter(supplierType=supplier_type)[
            1
        ].get_supplierType_display()

        expenses = (
            Expense.objects.values("supplier__name")
            .filter(
                supplier__supplierType=supplier_type,
                date__range=[initialDate, finishDate],
                restaurant_id=userId,
            )
            .annotate(total_amount=Sum("amount"))
            .order_by("supplier__name")
        )

        total = Expense.objects.filter(
            supplier__supplierType=supplier_type,
            date__range=[initialDate, finishDate],
            restaurant_id=userId,
        ).aggregate(total_amount=Sum("amount"))["total_amount"]

        if total is None:
            total = 0

        results.append({"name": name, "expenses": expenses, "total": total})
        financialsTotal += total

    return {"results": results, "total": financialsTotal}


def getCashReport(initial_cash, initial_date, finish_date, user_id):

    results = []
    date = initial_date
    initial_cash = round(float(initial_cash), 2)

    while date != finish_date + timedelta(days=1):
        cash_purchases = Expense.objects.filter(
            costCenter="cash", date=date, restaurant_id=user_id
        ).aggregate(total_amount=Sum("amount"))["total_amount"]

        if cash_purchases is None:
            cash_purchases = 0
        else:
            cash_purchases = float(cash_purchases)

        if user_id == 1:
            cash_data = CashLog.objects.get(date=date, restaurant_id=user_id)

            cash_sales = cash_data.cash_sales
            card_auto = cash_data.card_auto_grat
            card_tips = cash_data.card_tips
            cash_modifications = float(cash_data.modifications)

        elif user_id == 2:
            cash_data = daily_cash_data_clover('459RV00NPJJ11', date)

            cash_sales = round(cash_data['cash_sales'], 2)
            card_auto = round(cash_data['card_auto'], 2)
            card_tips = round(cash_data['card_tips'], 2)
            cash_modifications = float(CashLog.objects.get(date=date, restaurant_id=user_id).modifications)

        cash_out = round(float(cash_sales - card_auto - card_tips), 2)

        final_cash = round(initial_cash + cash_out - cash_purchases + cash_modifications, 2)

        results.append(
            {
                "date": date,
                "initialCash": initial_cash,
                "cashSales": cash_sales,
                "cardAuto": card_auto,
                "cardTips": card_tips,
                "cashOut": cash_out,
                "cashPurchases": cash_purchases,
                "cashModifications": cash_modifications,
                "finalCash": final_cash,
            }
        )

        initial_cash = final_cash
        date = date + timedelta(days=1)

    return results



