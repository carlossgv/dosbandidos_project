from accounting.models import Expense


def get_expenses_by_date(initial_date, finish_date, restaurant_id, supplier_id=False):
    if supplier_id:
        expenses = Expense.objects.filter(date__range=(initial_date, finish_date),
                                          restaurant_id=restaurant_id, supplier__pk=supplier_id)\
            .order_by('date')
    else:
        expenses = Expense.objects.filter(date__range=(initial_date, finish_date), restaurant_id=restaurant_id)\
            .order_by('date')

    return expenses
