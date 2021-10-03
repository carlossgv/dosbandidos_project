from rest_framework import serializers
from accounting.models import Expense


class ExpenseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Expense
        fields = ('id', 'restaurant', 'supplier', 'amount', 'date', 'cost_center', 'reference', 'comments')

