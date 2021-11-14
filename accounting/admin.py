from django.contrib import admin
from .models import Expense, Supplier, Income, CashLog, Metric, Rule, Restaurant

admin.site.register(Supplier)
admin.site.register(Expense)
admin.site.register(Income)
admin.site.register(CashLog)
admin.site.register(Metric)
admin.site.register(Rule)
admin.site.register(Restaurant)
