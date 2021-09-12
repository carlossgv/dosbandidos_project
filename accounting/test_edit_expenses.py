from django.test import TestCase
from .models import Expense, Supplier
from django.contrib.auth.models import User

from .utils_edit_expenses import get_expenses_by_date


class EditExpenses(TestCase):
    def setUp(self):
        User.objects.create_user(username='bixby',
                                 email='bixby@dosbandidos.com',
                                 password='bixby')

        Supplier.objects.create(name="Carlos Gonzalez",
                                supplier_type="labor")
        Supplier.objects.create(name="Superior",
                                supplier_type="service")
        Supplier.objects.create(name="KFC",
                                supplier_type="service")

        Supplier.objects.create(name="Stand By",
                                supplier_type="standBy",
                                pk=100)

        Expense.objects.create(amount=100,
                               date='2021-05-01',
                               cost_center='test',
                               supplier_id=1,
                               restaurant_id=1
                               )

        Expense.objects.create(amount=25,
                               date='2021-05-06',
                               cost_center='test',
                               supplier_id=2,
                               restaurant_id=1
                               )

        Expense.objects.create(amount=15,
                               date='2021-06-08',
                               cost_center='test',
                               supplier_id=3,
                               restaurant_id=1
                               )

        Expense.objects.create(amount=90,
                               date='2021-07-10',
                               cost_center='test',
                               supplier_id=3,
                               restaurant_id=1
                               )

    def test_get_all_expenses_by_date(self):
        initial_date = '2021-05-01'
        finish_date = '2021-06-08'
        restaurant_id = 1
        expenses = get_expenses_by_date(initial_date, finish_date, restaurant_id)
        self.assertEqual(len(expenses), 3)

    def test_get_all_expenses_by_date_and_supplier(self):
        initial_date = '2021-05-01'
        finish_date = '2021-06-08'
        restaurant_id = 1
        supplier_id = 3
        expenses = get_expenses_by_date(initial_date, finish_date, restaurant_id, supplier_id)
        self.assertEqual(len(expenses), 1)


