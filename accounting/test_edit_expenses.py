from django.test import TestCase
from .utils_csv_handling import read_csv, csv_create_expense, format_date, load_csv_expenses
from .models import Expense, Supplier, Rule
from django.contrib.auth.models import User

from .utils_edit_expenses import get_expenses_by_date


class EditExpenses(TestCase):
    def setUp(self):
        User.objects.create_user(username='bixby',
                                 email='bixby@dosbandidos.com',
                                 password='bixby')

        Supplier.objects.create(name="Carlos Gonzalez",
                                supplierType="labor")
        Supplier.objects.create(name="Superior",
                                supplierType="service")
        Supplier.objects.create(name="KFC",
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

        Expense.objects.create(amount=25,
                               date='2021-05-06',
                               costCenter='test',
                               supplier_id=2,
                               restaurant_id=1
                               )

        Expense.objects.create(amount=15,
                               date='2021-06-08',
                               costCenter='test',
                               supplier_id=3,
                               restaurant_id=1
                               )

        Expense.objects.create(amount=90,
                               date='2021-07-10',
                               costCenter='test',
                               supplier_id=3,
                               restaurant_id=1
                               )

    def test_get_all_expenses_by_date(self):
        initial_date = '2021-05-01'
        finish_date = '2021-06-08'
        expenses = get_expenses_by_date(initial_date, finish_date)
        self.assertEqual(len(expenses), 3)

    def test_get_all_expenses_by_date_and_supplier(self):
        initial_date = '2021-05-01'
        finish_date = '2021-06-08'
        supplier_id = 3
        expenses = get_expenses_by_date(initial_date, finish_date, supplier_id)
        self.assertEqual(len(expenses), 1)


