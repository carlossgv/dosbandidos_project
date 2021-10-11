from django import forms
from .models import Supplier


class EditExpensesForm(forms.Form):
    initial_date = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )
    finish_date = forms.DateField(
        label="Finish Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )
    # TODO: Take all of this to __init__
    # supplier_choices = [(None, "-----")]
    # for supplier in Supplier.objects.all().order_by("name"):
    #     supplier_choices.append((supplier.pk, supplier.name))

    suppliers = forms.ChoiceField(
        required=False,
        label="Suppliers",
        # choices=supplier_choices,
        widget=forms.Select(attrs={"class": "validate"}),
    )


class LoadExpensesForm(forms.Form):
    file = forms.FileField(label="Select file")
    delimiter = forms.ChoiceField(choices=[(None, "-----"), (",", ","), (";", ";")],
                                  label="Delimiter",
                                  widget=forms.Select(attrs={"class": "validate"}))
    cost_center = forms.ChoiceField(choices=[(None, "-----"),
                                             ("primaryAccount", "Primary Account"),
                                             ("expensesAccount", "Expenses Account")],
                                    label="Cost Center",
                                    widget=forms.Select(attrs={"class": "validate"}))


class LoadIncomesForm(forms.Form):
    file = forms.FileField(label="Select file")
    delimiter = forms.ChoiceField(choices=[(None, "-----"), (",", ","), (";", ";")],
                                  label="Delimiter",
                                  widget=forms.Select(attrs={"class": "validate"}))


class ExpensesForm(forms.Form):
    initial_date = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )
    finish_date = forms.DateField(
        label="Finish Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    # # TODO: Take all of this to __init__
    # supplier_choices = [(None, "-----")]
    # for supplier in Supplier.objects.all().order_by("name"):
    #     supplier_choices.append((supplier.pk, supplier.name))

    suppliers = forms.ChoiceField(
        required=False,
        label="Suppliers",
        # choices=supplier_choices,
        widget=forms.Select(attrs={"class": "validate"}),
    )

    # TODO: populate supplier choices dinamically
    supplier_type_choices = [
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
        required=False, label="Supplier Type", choices=supplier_type_choices
    )

    cash = forms.DecimalField(
        label="Initial Cash",
        decimal_places=2,
        required=False,
        widget=forms.NumberInput(attrs={"class": "validate"}),
    )
