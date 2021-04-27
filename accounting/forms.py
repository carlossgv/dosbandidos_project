from accounting.models import Supplier
from django import forms
from .models import Expense, Supplier


class ExpensesForm(forms.Form):
    initialDate = forms.DateField(
        label="Initial Date", widget=forms.widgets.DateInput(attrs={"type": "date"})
    )
    finishDate = forms.DateField(
        label="Finish Date", widget=forms.widgets.DateInput(attrs={"type": "date"})
    )


    suppliers = forms.ChoiceField(required=False)

    def __init__(self, *args, **kwargs):

        supplier_choices = [(None, "-----")]

        super().__init__(*args, **kwargs)
        for supplier in Supplier.objects.all().order_by("name"):
            supplier_choices.append((supplier.name, supplier.name))
        self.fields["suppliers"].widget.choices = supplier_choices


    # costCenter = forms.ChoiceField(
    #     choices=(Expense.objects.get())
    # )
