from datetime import datetime
from decimal import Decimal
from django.forms import DateField
from accounting.models import Income, Metric


def save_income_and_metrics(
    restaurant_id: int,
    initial_date: datetime,
    finish_date: datetime,
    net_sales: Decimal,
    gross_sales: Decimal,
    liquor_sales: Decimal,
    order_amount: Decimal,
    labor: Decimal,
) -> None:
    # 68 net sales
    # 74 liquor sales
    # 75 labor
    # 76 gross sales
    # 77 order count
    """
    Save income and metrics for a given period.
    """
    # Save income
    save_income(
        restaurant_id=restaurant_id,
        supplier_id=68,
        amount=net_sales,
        initial_date=initial_date,
        date=finish_date,
        comments="",
    )

    # Save metrics
    save_metric(
        restaurant_id=restaurant_id,
        supplier_id=74,
        amount=liquor_sales,
        initial_date=initial_date,
        date=finish_date,
        comments="",
    )

    save_metric(
        restaurant_id=restaurant_id,
        supplier_id=75,
        amount=labor,
        initial_date=initial_date,
        date=finish_date,
        comments="",
    )

    save_metric(
        restaurant_id=restaurant_id,
        supplier_id=76,
        amount=gross_sales,
        initial_date=initial_date,
        date=finish_date,
        comments="",
    )

    save_metric(
        restaurant_id=restaurant_id,
        supplier_id=77,
        amount=order_amount,
        initial_date=initial_date,
        date=finish_date,
        comments="",
    )


def save_income(
    restaurant_id: int,
    supplier_id: int,
    amount: Decimal,
    initial_date: datetime,
    date: datetime,
    comments: str,
) -> None:

    income = Income(
        restaurant_id=restaurant_id,
        supplier_id=supplier_id,
        amount=amount,
        initial_date=initial_date,
        date=date,
        comments=comments,
    )
    income.save()


def save_metric(
    restaurant_id: int,
    supplier_id: int,
    amount: Decimal,
    initial_date: datetime,
    date: datetime,
    comments: str,
) -> None:

    metric = Metric(
        restaurant_id=restaurant_id,
        supplier_id=supplier_id,
        amount=amount,
        initial_date=initial_date,
        date=date,
        comments=comments,
    )
    metric.save()
