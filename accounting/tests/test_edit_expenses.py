from django.test import TestCase

from .script_test_database import load_test_database
from accounting.utils.utils_edit_expenses import get_expenses_by_date
from accounting.models import Expense, Income, Supplier, Rule


class EditExpenses(TestCase):
    @classmethod
    def setUpTestData(cls):
        load_test_database()

    def tearDown(self) -> None:
        """empty current database"""
        Expense.objects.all().delete()
        Income.objects.all().delete()
        Supplier.objects.all().delete()
        Rule.objects.all().delete()

    def test_get_all_expenses_by_date(self):
        initial_date = "2021-05-01"
        finish_date = "2021-06-08"
        restaurant_id = 1
        expenses = get_expenses_by_date(initial_date, finish_date, restaurant_id)
        self.assertEqual(len(expenses), 4)

    def test_get_all_expenses_by_date_and_supplier(self):
        initial_date = "2021-05-01"
        finish_date = "2021-06-08"
        restaurant_id = 1
        supplier_id = 3
        expenses = get_expenses_by_date(
            initial_date, finish_date, restaurant_id, supplier_id
        )
        self.assertEqual(len(expenses), 1)
