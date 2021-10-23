from django.contrib.auth.models import User

from accounting.models import Expense, Supplier, Rule


def load_test_database():
    User.objects.create_user(username='bixby',
                             email='bixby@dosbandidos.com',
                             password='bixby')

    Supplier.objects.create(name="Carlos Gonzalez",
                            supplier_type="labor")
    Supplier.objects.create(name="Superior",
                            supplier_type="service")
    Supplier.objects.create(name="KFC",
                            supplier_type="service")
    Supplier.objects.create(name="Clover",
                            supplier_type="service")
    Supplier.objects.create(name="Doordash",
                            supplier_type="service")
    Supplier.objects.create(name="Stand By",
                            supplier_type="standBy",
                            pk=100)

    Expense.objects.create(amount=100,
                           date='2021-05-01',
                           cost_center='test',
                           reference="",
                           comments="",
                           supplier_id=2,
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
    Expense.objects.create(amount=100,
                           date='2021-05-01',
                           cost_center='test',
                           supplier_id=1,
                           restaurant_id=1
                           )

    Rule.objects.create(description="ACH Debit - ACH Bill.com   Superior Linen - Dos Bandidos",
                        supplier_id=2)

    Rule.objects.create(description="CLOVER", supplier_id=4)

    Rule.objects.create(description="DoorDash", supplier_id=5)
