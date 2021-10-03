from django.urls import path
from .views import ExpenseList, ExpenseDetail

app_name = 'api'

urlpatterns = [
    path('v1/expenses/', ExpenseList.as_view(), name='expenses_list'),
    path('v1/expense/<int:pk>', ExpenseDetail.as_view(), name='expense_detail'),
    path('v1/reports/goals', ExpenseDetail.as_view(), name='goals_report'),
]
