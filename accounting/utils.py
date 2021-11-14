from .models import CashLog, Supplier, Expense, Income, Metric
from django.db.models import Sum
from datetime import timedelta
from .utils_api_clover import daily_cash_data_clover


def get_expenses_by_supplier(supplier_id, initial_date, finish_date, user_id):
    name = Supplier.objects.get(pk=supplier_id).name

    expenses = (
        Expense.objects.filter(
            supplier=supplier_id,
            date__range=[initial_date, finish_date],
            restaurant_id=user_id,
        )
        .annotate(total_amount=Sum("amount"))
        .order_by("date")
    )

    total = Expense.objects.filter(
        supplier=supplier_id,
        date__range=[initial_date, finish_date],
        restaurant_id=user_id,
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total is None:
        total = 0

    return {"name": name, "total": round(total, 2), "expenses": expenses}


def get_income_by_supplier(supplier_id, initial_date, finish_date, user_id):
    name = Supplier.objects.get(pk=supplier_id).name

    total = Income.objects.filter(
        supplier=supplier_id,
        date__range=[initial_date, finish_date],
        restaurant_id=user_id,
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total is None:
        total = 0

    return {"name": name, "total": round(total, 2)}


def get_metric_by_supplier(supplier_id, initial_date, finish_date, user_id):
    name = Supplier.objects.get(pk=supplier_id).name

    total = Metric.objects.filter(
        supplier=supplier_id,
        date__range=[initial_date, finish_date],
        restaurant_id=user_id,
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total is None:
        total = 0

    return {"name": name, "total": round(total, 2)}


def convert_to_camel_case(string):
    res = [string[0].lower()]
    for c in string[1:]:
        if c in "ABCDEFGHIJKLMNOPQRSTUVWXYZ":
            res.append("_")
            res.append(c.lower())
        elif c == " ":
            res.append("")
        else:
            res.append(c)

    return "".join(res)


def get_metrics(initial_date, finish_date, user_id):
    metrics_list = Supplier.objects.filter(supplier_type="restaurantInfo")
    metrics = {}

    for supplier in metrics_list:
        metric_data = get_metric_by_supplier(
            supplier.pk, initial_date, finish_date, user_id
        )
        metrics[convert_to_camel_case(supplier.name.title())] = metric_data

    metrics["restaurant_net_sales"] = get_income_by_supplier(
        68, initial_date, finish_date, user_id
    )
    metrics["food_net_sales"] = {
        "name": "Restaurant Food Sales",
        "total": metrics["restaurant_net_sales"]["total"]
        - metrics["restaurant_liquor_sales"]["total"],
    }

    return metrics


def get_incomes(initial_date, finish_date, user_id):
    supplier_list = Supplier.objects.filter(supplier_type="sales")
    incomes = []
    total = 0
    restaurant_sales = 0

    for supplier in supplier_list:
        income_data = get_income_by_supplier(
            supplier.pk, initial_date, finish_date, user_id
        )
        incomes.append(income_data)
        total += income_data["total"]
        if supplier.name == "Restaurant Net Sales":
            restaurant_sales = income_data["total"]

    return {"incomes": incomes, "total": total, "restaurant_sales": restaurant_sales}


def get_expenses_by_supplier_type(supplier_type, initial_date, finish_date, user_id):
    supplier_type = Supplier.objects.filter(supplier_type=supplier_type)[
        1
    ].supplier_type

    name = Supplier.objects.filter(supplier_type=supplier_type)[
        1
    ].get_supplier_type_display()

    expenses = (
        Expense.objects.filter(
            supplier__supplier_type=supplier_type,
            date__range=[initial_date, finish_date],
            restaurant_id=user_id,
        )
        .annotate(total_amount=Sum("amount"))
        .order_by("date")
    )

    total = Expense.objects.filter(
        supplier__supplier_type=supplier_type,
        date__range=[initial_date, finish_date],
        restaurant_id=user_id,
    ).aggregate(total_amount=Sum("amount"))["total_amount"]

    if total is None:
        total = 0

    return {
        "name": name,
        "total": round(total, 2),
        "expenses": expenses,
    }


def totalize_suppliers(suppliers_list, initial_date, finish_date, user_id):
    total = 0
    suppliers_totals = []
    for supplier in suppliers_list:

        if supplier["type"] == "supplier":
            supplier_data = get_expenses_by_supplier(
                supplier["id"], initial_date, finish_date, user_id
            )
            try:
                data
            except:
                data = supplier_data["expenses"]
            else:
                data = data | supplier_data["expenses"]

            total += supplier_data["total"]
            suppliers_totals.append(
                {"name": supplier_data["name"], "total": supplier_data["total"]}
            )
        else:
            type_data = get_expenses_by_supplier_type(
                supplier["type"], initial_date, finish_date, user_id
            )
            data = data | type_data["expenses"]
            total += type_data["total"]
            suppliers_totals.append(
                {"name": type_data["name"], "total": type_data["total"]}
            )

    return {"total": total, "data": data, "suppliers_totals": suppliers_totals}


def get_goals_report(initial_date, finish_date, restaurant_id):
    # SGC (29), Paisa (31), Mil Arcos (30), Sams (32), Walmart (33)
    food_suppliers = [
        {"id": 29, "type": "supplier"},
        {"id": 31, "type": "supplier"},
        {"id": 30, "type": "supplier"},
        {"id": 32, "type": "supplier"},
        {"id": 33, "type": "supplier"},
        {"type": "foodMisc"},
    ]

    # Jarboe (34), IDF (35), Republic (36), Boardwalk (37), Store (38)
    liquor_suppliers = [
        {"id": 34, "type": "supplier"},
        {"id": 35, "type": "supplier"},
        {"id": 36, "type": "supplier"},
        {"id": 37, "type": "supplier"},
        {"id": 38, "type": "supplier"},
        {"type": "liquorMisc"},
    ]

    food_expenses = totalize_suppliers(
        food_suppliers, initial_date, finish_date, restaurant_id
    )
    liquor_expenses = totalize_suppliers(
        liquor_suppliers, initial_date, finish_date, restaurant_id
    )

    incomes = get_incomes(initial_date, finish_date, restaurant_id)
    restaurant_sales = incomes["restaurant_sales"]

    metrics = get_metrics(initial_date, finish_date, restaurant_id)

    if metrics["restaurant_order_count"]["total"] != 0:
        metrics["order_average"] = {
            "name": "Order Average",
            "total": round(
                metrics["restaurant_gross_sales"]["total"]
                / metrics["restaurant_order_count"]["total"],
                2,
            ),
        }
        metrics["labor_goal"] = {
            "name": "Labor Goal",
            "total": round(
                metrics["restaurant_labor"]["total"] / restaurant_sales * 100
            ),
        }

        food_cost = food_expenses["total"] / metrics["food_net_sales"]["total"]

        metrics["food_cost"] = {"name": "Food Cost", "total": round(food_cost * 100)}

        liquor_cost = (
            liquor_expenses["total"] / metrics["restaurant_liquor_sales"]["total"]
        )
        metrics["liquor_cost"] = {
            "name": "Liquor Cost",
            "total": round(liquor_cost * 100),
        }

        cost_average = (
            metrics["food_cost"]["total"] + metrics["liquor_cost"]["total"]
        ) / 2
        metrics["cost_average"] = {"name": "Cost Average", "total": cost_average}

    else:
        metrics["order_average"] = "No info"
        metrics["labor_goal"] = "No info"

    return {"food": food_expenses, "liquor": liquor_expenses, "metrics": metrics}


def get_financials_report(initial_date, finish_date, user_id):
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
    financials_total = 0

    for supplier_type in supplier_types:
        name = Supplier.objects.filter(supplier_type=supplier_type)[
            1
        ].get_supplier_type_display()

        expenses = (
            Expense.objects.values("supplier__name")
            .filter(
                supplier__supplier_type=supplier_type,
                date__range=[initial_date, finish_date],
                restaurant_id=user_id,
            )
            .annotate(total_amount=Sum("amount"))
            .order_by("supplier__name")
        )

        total = Expense.objects.filter(
            supplier__supplier_type=supplier_type,
            date__range=[initial_date, finish_date],
            restaurant_id=user_id,
        ).aggregate(total_amount=Sum("amount"))["total_amount"]

        if total is None:
            total = 0

        results.append({"name": name, "expenses": expenses, "total": total})
        financials_total += total

    return {"results": results, "total": financials_total}


def get_cash_report(initial_cash, initial_date, finish_date, restaurant_id):
    results = []
    date = initial_date
    initial_cash = round(float(initial_cash), 2)

    while date != finish_date + timedelta(days=1):
        cash_purchases = Expense.objects.filter(
            cost_center="cash", date=date, restaurant_id=restaurant_id
        ).aggregate(total_amount=Sum("amount"))["total_amount"]

        if cash_purchases is None:
            cash_purchases = 0
        else:
            cash_purchases = float(cash_purchases)

        print(restaurant_id, type(restaurant_id))

        if restaurant_id == "1":
            cash_data = CashLog.objects.get(date=date, restaurant_id=restaurant_id)
            cash_sales = cash_data.cash_sales
            card_auto = cash_data.card_auto_grat
            card_tips = cash_data.card_tips
            cash_modifications = float(cash_data.modifications)

        elif restaurant_id == "2":
            cash_data = daily_cash_data_clover("459RV00NPJJ11", date)

            cash_sales = round(cash_data["cash_sales"], 2)
            card_auto = round(cash_data["card_auto"], 2)
            card_tips = round(cash_data["card_tips"], 2)
            cash_modifications = float(
                CashLog.objects.get(
                    date=date, restaurant_id=restaurant_id
                ).modifications
            )

        cash_out = round(float(cash_sales - card_auto - card_tips), 2)

        final_cash = round(
            initial_cash + cash_out - cash_purchases + cash_modifications, 2
        )

        results.append(
            {
                "date": date,
                "initial_cash": initial_cash,
                "cash_sales": cash_sales,
                "card_auto": card_auto,
                "card_tips": card_tips,
                "cash_out": cash_out,
                "cash_purchases": cash_purchases,
                "cash_modifications": cash_modifications,
                "final_cash": final_cash,
            }
        )

        initial_cash = final_cash
        date = date + timedelta(days=1)

    return results
