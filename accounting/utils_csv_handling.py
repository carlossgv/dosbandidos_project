import csv
import datetime
import os

from .models import Expense, Rule, Income


def load_csv_incomes(filepath: str, delimiter: str, restaurant_id: str):
    with open(filepath, newline='') as file:
        read_file = csv.reader(file, delimiter=delimiter)
        # Skip header:
        next(read_file)

        for row in read_file:
            csv_create_income(row, restaurant_id)


def load_csv_expenses(filepath: str, delimiter: str, restaurant_id: str, cost_center: str):
    with open(filepath, newline='') as file:
        read_file = csv.reader(file, delimiter=delimiter)
        # Skip header:
        next(read_file)

        for row in read_file:
            csv_create_expense(row, restaurant_id, cost_center)

    # TODO: Create CSV before test
    if filepath == "./tests_data/AccountHistory.csv":
        return

    os.remove(filepath)


def format_date(date):
    formatted_date = datetime.datetime.strptime(date, '%m/%d/%Y').strftime('%Y-%m-%d')
    return formatted_date


def csv_create_expense(row, restaurant_id, cost_center):
    data = {
        'date': row[1],
        'check': row[2],
        'description': row[3],
        'debit': row[4],
        'credit': row[5],
        'status': row[6],
    }

    # Exclude incomes
    if data['debit'] == '':
        return

    rules = Rule.objects.all()
    supplier_id = 100

    for rule in rules:
        if rule.description in data['description']:
            supplier_id = rule.supplier.pk
            break

    expense = Expense(amount=data['debit'],
                      date=format_date(data['date']),
                      cost_center=cost_center,
                      reference=data['check'],
                      comments=data['description'],
                      supplier_id=supplier_id,
                      restaurant_id=restaurant_id
                      )

    expense.save()


def csv_create_income(row, restaurant_id: str):
    data = {
        'date': row[1],
        'check': row[2],
        'description': row[3],
        'debit': row[4],
        'credit': row[5],
        'status': row[6],
    }

    # Exclude expenses
    if data['credit'] == '':
        return

    rules = Rule.objects.all()
    # Supplier 100 is "Stand by"
    supplier_id = 100

    for rule in rules:
        if rule.description in data['description']:
            supplier_id = rule.supplier.pk
            break

    income = Income(
        amount=data['credit'],
        date=format_date(data['date']),
        comments=data['description'],
        supplier_id=supplier_id,
        restaurant_id=restaurant_id
    )

    income.save()
