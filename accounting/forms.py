from django.forms import widgets
from accounting.models import Supplier
from django import forms
from .models import Supplier


class ExpensesForm(forms.Form):
    initialDate = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )
    finishDate = forms.DateField(
        label="Finish Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    # TODO: Take all of this to __init__
    supplier_choices = [(None, "-----")]
    for supplier in Supplier.objects.all().order_by("name"):
        supplier_choices.append((supplier.pk, supplier.name))

    suppliers = forms.ChoiceField(
        required=False,
        label="Suppliers",
        choices=supplier_choices,
        widget=forms.Select(attrs={"class": "validate"}),
    )

    # TODO: populate supplier choices dinamically
    supplierType_choices = [
        (None, "-----"),
        ("operationFood", "Food"),
        ("operationLiquor", "Liquor"),
        ("foodMisc", "Food (Miscellaneous)"),
        ("liquorMisc", "Liquor (Miscellaneous)"),
        ("labor", "Labor"),
        ("service", "Services"),
        ("uncategorized", "Uncategorized"),
    ]
    # for supplier in (
    #     Supplier.objects.order_by("supplierType").distinct()
    # ):

    #     print(supplier)

    # supplierType_choices.append(
    #     (supplier["supplierType"], supplier['supplierType'])
    # )

    supplier_type = forms.ChoiceField(
        required=False, label="Supplier Type", choices=supplierType_choices
    )

    cash = forms.DecimalField(
        label="Initial Cash",
        decimal_places=2,
        required=False,
        widget=forms.NumberInput(attrs={"class": "validate"}),
    )
