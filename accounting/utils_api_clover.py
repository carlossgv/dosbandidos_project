import os
import requests
import datetime
import pytz as pytz
import time

from accounting.models import CashLog


def get_orders_clover(merchant_id, initial_date, finish_date):
    initial_date = transform_to_epoch(initial_date, "initial")
    finish_date = transform_to_epoch(finish_date, "finish")

    headers = {
        "accept": "application/json",
        "authorization": f'Bearer {os.environ.get("DOSBANDIDOS_CLOVER_API")}',
    }
    response = requests.get(
        f"https://api.clover.com/v3/merchants/{merchant_id}/orders?filter=createdTime>{initial_date}"
        f"&filter=createdTime<{finish_date}&expand=payments&expand=serviceCharge&limit=500",
        headers=headers,
    )

    orders = response.json()
    time.sleep(1)

    return orders


def get_payment_details(merchant_id, payment_id):
    headers = {
        "accept": "application/json",
        "authorization": f'Bearer {os.environ.get("DOSBANDIDOS_CLOVER_API")}',
    }
    response = requests.get(
        f"https://api.clover.com/v3/merchants/{merchant_id}/payments/{payment_id}?expand=taxRates",
        headers=headers,
    )

    payment_details = response.json()
    time.sleep(1)

    return payment_details


def get_refund_details(merchant_id, refund_id):
    headers = {
        "accept": "application/json",
        "authorization": f'Bearer {os.environ.get("DOSBANDIDOS_CLOVER_API")}',
    }
    response = requests.get(
        f"https://api.clover.com/v3/merchants/{merchant_id}/refunds/{refund_id}?expand=serviceCharge",
        headers=headers,
    )

    refund_details = response.json()
    time.sleep(1)

    return refund_details


def get_refunds_list(merchant_id, initial_date, finish_date):
    initial_date = transform_to_epoch(initial_date, "initial")
    finish_date = transform_to_epoch(finish_date, "finish")

    headers = {
        "accept": "application/json",
        "authorization": f'Bearer {os.environ.get("DOSBANDIDOS_CLOVER_API")}',
    }
    response = requests.get(
        f"https://api.clover.com/v3/merchants/{merchant_id}/refunds?filter=createdTime>{initial_date}"
        f"&filter=createdTime<{finish_date}&limit=500",
        headers=headers,
    )

    refunds = response.json()
    time.sleep(1)

    return refunds


def daily_cash_data_clover(merchant_id, date, restaurant_id: int):
    print("ORDERS ", len(get_orders_clover(merchant_id, date, date)["elements"]))
    orders = get_orders_clover(merchant_id, date, date)["elements"]
    print("REFUNDS ", len(get_refunds_list(merchant_id, date, date)["elements"]))
    refunds = get_refunds_list(merchant_id, date, date)["elements"]

    # Cash Tender ID: D8ER2CY0D5NX8

    cash_sales = 0
    card_auto_grat = 0
    card_tips = 0

    for order in orders:
        for payment in order["payments"]["elements"]:

            if "tipAmount" in payment:
                card_tips += payment["tipAmount"] / 100

            if "serviceCharge" in order:
                service_charge_percentage = order["serviceCharge"]["percentage"]
                payment_details = get_payment_details(merchant_id, payment["id"])

                for tax_rate in payment_details["taxRates"]["elements"]:
                    taxable_amount = tax_rate["taxableAmount"] / 100

                    card_auto_grat += taxable_amount * service_charge_percentage / 100

            if payment["tender"]["id"] == "D8ER2CY0D5NX8":
                cash_sales += payment["amount"] / 100

    for refund in refunds:
        if "tipAmount" in refund:
            card_tips -= refund["tipAmount"] / 100

        if "serviceCharge" in refund:
            service_charge_percentage = refund["serviceCharge"]["percentage"]
            refund_details = get_refund_details(merchant_id, refund["id"])

            for tax_rate in refund_details["taxRates"]["elements"]:
                taxable_amount = tax_rate["taxableAmount"] / 100

                card_auto_grat -= taxable_amount * service_charge_percentage / 100

        if refund["payment"]["tender"]["id"] == "D8ER2CY0D5NX8":
            cash_sales -= refund["amount"] / 100

    cash_sales = round(cash_sales, 2)
    card_auto_grat = round(card_auto_grat, 2)
    card_tips = round(card_tips, 2)
    try:
        modifications = float(
            CashLog.objects.get(date=date, restaurant_id=restaurant_id).modifications
        )
    except:
        modifications = 0

    return {
        "cash_sales": cash_sales,
        "card_auto_grat": card_auto_grat,
        "card_tips": card_tips,
        "modifications": modifications,
    }


def transform_to_epoch(date, date_type, location="US/Central"):
    offset = (
        pytz.timezone(location)
        .localize(datetime.datetime(date.year, date.month, date.day))
        .strftime("%z")
    )
    offset = int(offset) * -1 / 100

    if date_type == "initial":
        hour = 0
        minute = 0
    elif date_type == "finish":
        hour = 23
        minute = 59

    date = datetime.datetime(
        date.year, date.month, date.day, hour, minute, tzinfo=datetime.timezone.utc
    ) + datetime.timedelta(hours=offset)

    date = int(date.timestamp()) * 1000

    return date
