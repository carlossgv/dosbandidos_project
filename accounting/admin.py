from django.contrib import admin
from .models import Expense, Supplier

admin.site.register(Supplier)
admin.site.register(Expense)


