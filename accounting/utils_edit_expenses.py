from accounting.models import Expense


def get_expenses_by_date(initial_date, finish_date, supplier_id=False):
    if supplier_id:
        expenses = Expense.objects.filter(date__range=(initial_date, finish_date), supplier__pk=supplier_id)
    else:
        expenses = Expense.objects.filter(date__range=(initial_date, finish_date))
    print(expenses)

    return expenses
