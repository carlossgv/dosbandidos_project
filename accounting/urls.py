from accounting import views
from django.urls import path
from django.contrib import admin

urlpatterns = [
    path("", views.home, name="accounting-home"),
    path("edit-expenses/", views.edit_expenses, name="accounting-edit-expenses"),
    path("incomes", views.incomes, name="incomes"),
    path("cash_log", views.cash_log, name="cash_log"),
    path(
        "create-daily-cash-log",
        views.create_daily_cash_log,
        name="create-daily-cash-log",
    ),
    path("create-expense", views.create_expense, name="create-expense"),
    path('admin', admin.site.urls),
]
