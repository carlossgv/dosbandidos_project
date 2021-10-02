from django.test import TestCase

from .script_test_database import load_test_database
from .utils_edit_expenses import get_expenses_by_date


class EditExpenses(TestCase):
    def setUp(self):
        load_test_database()

    def test_get_all_expenses_by_date(self):
        initial_date = '2021-05-01'
        finish_date = '2021-06-08'
        restaurant_id = 1
        expenses = get_expenses_by_date(initial_date, finish_date, restaurant_id)
        self.assertEqual(len(expenses), 4)

    def test_get_all_expenses_by_date_and_supplier(self):
        initial_date = '2021-05-01'
        finish_date = '2021-06-08'
        restaurant_id = 1
        supplier_id = 3
        expenses = get_expenses_by_date(initial_date, finish_date, restaurant_id, supplier_id)
        self.assertEqual(len(expenses), 1)
