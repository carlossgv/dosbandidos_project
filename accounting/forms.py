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

    # TODO: Take all of this to __init__
    supplier_choices = [(None, "-----")]
    for supplier in Supplier.objects.all().order_by("name"):
        supplier_choices.append((supplier.pk, supplier.name))

    suppliers = forms.ChoiceField(
        required=False, label="Suppliers", choices=supplier_choices
    )

    supplierType_choices = [(None, "-----")]
    for supplier in (
        Supplier.objects.values("supplierType").order_by("supplierType").distinct()
    ):

        supplierType_choices.append(
            (supplier["supplierType"], supplier["supplierType"])
        )

    supplier_type = forms.ChoiceField(
        required=False, label="Supplier Type", choices=supplierType_choices
    )
