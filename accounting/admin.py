from django.contrib import admin
from .models import Expense, Supplier, Income, CashLog, Metric

admin.site.register(Supplier)
admin.site.register(Expense)
admin.site.register(Income)
admin.site.register(CashLog)
admin.site.register(Metric)
