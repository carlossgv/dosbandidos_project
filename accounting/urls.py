from . import views
from django.urls import path

urlpatterns = [
    path('', views.home, name='accounting-home'),
    path('edit-expenses/', views.edit_expenses, name='accounting-edit-expenses')
]
