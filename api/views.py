from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from .serializers import ExpenseSerializer
from accounting.models import Expense


class ExpenseList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ExpenseSerializer

    def get_queryset(self):
        initial_date = self.request.query_params.get('initial_date')
        finish_date = self.request.query_params.get('finish_date')
        supplier = self.request.query_params.get('supplier')

        if supplier is not None:
            queryset = Expense.objects.filter(date__range=[initial_date, finish_date], supplier=supplier)
        else:
            queryset = Expense.objects.filter(date__range=[initial_date, finish_date])

        return queryset


class ExpenseDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Expense.objects.all()
    serializer_class = ExpenseSerializer
