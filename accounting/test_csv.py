from datetime import datetime

from django.test import TestCase

from .script_test_database import load_test_database
from .utils_csv_handling import csv_create_expense, format_date, load_csv_expenses, load_csv_incomes
from .models import Expense, Supplier, Income


class CsvReading(TestCase):
    def setUp(self):
        load_test_database()

    def test_transform_date_to_django_format(self):
        date = '8/6/2021'

        formatted_date = format_date(date)

        self.assertEqual(formatted_date, '2021-08-06')

    def test_create_expense_by_row_if_no_rule(self):
        # Superior ID: 25
        row = ['XXXXXX4583', '8/2/2021', '110134', 'CHECK -  -', '615.58', '', 'Posted', '']

        cost_center = 'primaryAccount'

        csv_create_expense(row, 1, cost_center)

        expense = Expense.objects.all().order_by('-id')[0]

        self.assertEqual(expense.supplier.pk, 100)
        self.assertEqual(float(expense.amount), 615.58)
        self.assertEqual(expense.cost_center, cost_center)

    def test_create_expense_by_row_if_description_contains_a_rule(self):
        # Superior ID: 25
        row = ['XXXXXX4583', '8/6/2021', '', 'ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken',
               '97.50', '', 'Posted', '']
        cost_center = 'primaryAccount'

        csv_create_expense(row, 1, cost_center)

        expense = Expense.objects.all().order_by('-id')[0]

        self.assertEqual(expense.supplier.pk, 2)
        self.assertEqual(expense.amount, 97.50)
        self.assertEqual(expense.cost_center, 'primaryAccount')

    def test_load_expenses_to_db(self):
        filepath = "./tests_data/AccountHistory.csv"
        delimiter = ","
        cost_center = "primaryAccount"
        load_csv_expenses(filepath, delimiter, '1', cost_center)

        clover_id = Supplier.objects.get(pk=4)
        test_expense = Expense.objects.get(supplier=clover_id)

        self.assertEqual(str(test_expense.amount), '89.85')

    def test_load_incomes_to_db(self):
        filepath = "./tests_data/AccountHistory.csv"
        delimiter = ","
        load_csv_incomes(filepath, delimiter, '1')

        doordash_id = Supplier.objects.get(pk=5)
        text_income = Income.objects.get(supplier=doordash_id)

        self.assertEqual(str(text_income.amount), '1021.26')
