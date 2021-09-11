from django.test import TestCase
from .utils_csv_handling import read_csv, csv_create_expense, format_date, load_csv_expenses
from .models import Expense, Supplier, Rule
from django.contrib.auth.models import User


class CsvReading(TestCase):
    def setUp(self):
        User.objects.create_user(username='bixby',
                                 email='bixby@dosbandidos.com',
                                 password='bixby')

        Supplier.objects.create(name="Carlos Gonzalez",
                                supplierType="labor")
        Supplier.objects.create(name="Superior",
                                supplierType="service")

        Supplier.objects.create(name="Stand By",
                                supplierType="standBy",
                                pk=100)

        Expense.objects.create(amount=100,
                               date='2021-05-01',
                               costCenter='test',
                               supplier_id=1,
                               restaurant_id=1
                               )
        Rule.objects.create(description="ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos",
                            supplier_id=2)

    def test_can_read_csv(self):
        filepath = "./testsdata/AccountHistory.csv"
        delimiter = ","
        data = read_csv(filepath, delimiter)
        self.assertEqual(data, True)

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
        self.assertEqual(expense.costCenter, cost_center)

    def test_create_expense_by_row_if_description_contains_a_rule(self):
        # Superior ID: 25
        row = ['XXXXXX4583', '8/6/2021', '', 'ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos - Broken',
               '97.50', '', 'Posted', '']
        cost_center = 'primaryAccount'

        csv_create_expense(row, 1, cost_center)

        expense = Expense.objects.all().order_by('-id')[0]

        self.assertEqual(expense.supplier.pk, 2)
        self.assertEqual(expense.amount, 97.50)
        self.assertEqual(expense.costCenter, 'primaryAccount')

    def test_load_expenses_to_db(self):
        filepath = "./testsdata/AccountHistory.csv"
        delimiter = ","
        cost_center = "primaryAccount"
        data = load_csv_expenses(filepath, delimiter, 1, cost_center)

        self.assertEqual(data, True)
