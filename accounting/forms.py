from django import forms
from .models import Supplier


class EditExpensesForm(forms.Form):
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


# TODO: ADD DROPDOWN LIST TO SELECT COST CENTER
class LoadExpensesForm(forms.Form):
    # file = forms.FileField(label="Select file")
    path = forms.CharField(max_length=None)
    delimiter = forms.ChoiceField(choices=[(",", ","), (";", ";")],
                                  label="Delimiter",
                                  widget=forms.Select(attrs={"class": "validate"}))


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

    supplier_type = forms.ChoiceField(
        required=False, label="Supplier Type", choices=supplierType_choices
    )

    cash = forms.DecimalField(
        label="Initial Cash",
        decimal_places=2,
        required=False,
        widget=forms.NumberInput(attrs={"class": "validate"}),
    )
