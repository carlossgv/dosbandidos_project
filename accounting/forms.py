from django import forms
from django.db.models.query_utils import Q
from .models import Restaurant, Supplier
import datetime


class CreateExpenseForm(forms.Form):
    date = forms.DateField(
        label="Date",
        widget=forms.widgets.DateInput(
            attrs={
                "type": "date",
                "class": "validate",
                "value": datetime.date.today(),
            }
        ),
    )

    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        widget=forms.Select(attrs={"class": "validate"}),
    )

    supplier = forms.ChoiceField(
        required=False,
        label="Supplier",
        choices=(),
        widget=forms.Select(attrs={"class": "validate"}),
    )

    amount = forms.DecimalField(
        label="Amount",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )

    reference = forms.CharField(
        label="Reference",
        required=False,
    )

    comments = forms.CharField(
        label="Comments",
        required=False,
        widget=forms.Textarea(attrs={"class": "materialize-textarea"}),
    )

    def __init__(self, *args, **kwargs):
        supplier_choices = [(None, "-----")]
        for supplier in Supplier.objects.all().order_by("name"):
            supplier_choices.append((supplier.pk, supplier.name))

        super(CreateExpenseForm, self).__init__(*args, **kwargs)
        self.fields["supplier"] = forms.ChoiceField(
            choices=supplier_choices,
            required=True,
            label="Supplier",
            widget=forms.Select(attrs={"class": "validate"}),
        )


class ViewCashLogForm(forms.Form):
    date = forms.DateField(
        label="Date",
        widget=forms.widgets.DateInput(
            attrs={
                "type": "date",
                "class": "validate",
                "value": datetime.date.today(),
            }
        ),
    )

    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        widget=forms.Select(attrs={"class": "validate"}),
    )


class CreateCashLogForm(forms.Form):
    date = forms.DateField(
        label="Date",
        widget=forms.widgets.DateInput(
            attrs={
                "type": "date",
                "class": "validate",
                "value": datetime.date.today(),
            }
        ),
    )

    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        widget=forms.Select(attrs={"class": "validate"}),
    )

    cash_sales = forms.DecimalField(
        label="Cash Sales",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )

    card_auto_grat = forms.DecimalField(
        label="Card Auto Gratuity",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )

    card_tips = forms.DecimalField(
        label="Card Tips",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )

    modifications = forms.DecimalField(
        label="Modifications",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )

    comments = forms.CharField(
        label="Comments",
        required=False,
        widget=forms.Textarea(attrs={"class": "materialize-textarea"}),
    )

    def __init__(self, *args, **kwargs):
        restaurant_choices = [(None, "-----")]
        for restaurant in Restaurant.objects.all():
            restaurant_choices.append((restaurant.pk, restaurant.name))

        super(CreateCashLogForm, self).__init__(*args, **kwargs)
        self.fields["restaurant"] = forms.ChoiceField(
            choices=restaurant_choices,
            required=True,
            label="Restaurant",
            widget=forms.Select(attrs={"class": "validate"}),
        )


class EditCashLogForm(forms.Form):
    initial_date = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    restaurant_id = forms.ChoiceField(
        required=True,
        label="Restaurant",
        choices=[(None, "-----"), (1, "Bixby"), (2, "BA")],
        widget=forms.Select(attrs={"class": "validate"}),
    )

    def __init__(self, *args, **kwargs):
        restaurant_choices = [(None, "-----")]
        for restaurant in Restaurant.objects.all():
            restaurant_choices.append((restaurant.pk, restaurant.name))

        super(EditCashLogForm, self).__init__(*args, **kwargs)
        self.fields["restaurant_id"] = forms.ChoiceField(
            choices=restaurant_choices,
            required=True,
            label="Restaurant",
            widget=forms.Select(attrs={"class": "validate"}),
        )


class EditExpensesForm(forms.Form):
    initial_date = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )
    finish_date = forms.DateField(
        label="Finish Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    suppliers = forms.ChoiceField(
        required=False,
        label="Suppliers",
        choices=(),
        widget=forms.Select(attrs={"class": "validate"}),
    )

    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        # choices=[(None, "-----"), (1, "Bixby"), (2, "BA")],
        widget=forms.Select(attrs={"class": "validate"}),
    )

    def __init__(self, *args, **kwargs):
        supplier_choices = [(None, "-----")]
        for supplier in Supplier.objects.all().order_by("name"):
            supplier_choices.append((supplier.pk, supplier.name))

        super(EditExpensesForm, self).__init__(*args, **kwargs)
        self.fields["suppliers"] = forms.ChoiceField(
            choices=supplier_choices,
            required=False,
            label="Suppliers",
            widget=forms.Select(attrs={"class": "validate"}),
        )


class LoadExpensesForm(forms.Form):
    file = forms.FileField(label="Select file")
    delimiter = forms.ChoiceField(
        choices=[(None, "-----"), (",", ","), (";", ";")],
        label="Delimiter",
        widget=forms.Select(attrs={"class": "validate"}),
    )
    cost_center = forms.ChoiceField(
        choices=[
            (None, "-----"),
            ("primaryAccount", "Primary Account"),
            ("expensesAccount", "Expenses Account"),
        ],
        label="Cost Center",
        widget=forms.Select(attrs={"class": "validate"}),
    )
    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        choices=[(None, "-----"), (1, "Bixby"), (2, "BA")],
        widget=forms.Select(attrs={"class": "validate"}),
    )


class LoadIncomesForm(forms.Form):
    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        choices=[(None, "-----"), (2, "BA")],
        widget=forms.Select(attrs={"class": "validate"}),
    )

    initial_date = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    finish_date = forms.DateField(
        label="Finish Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    net_sales = forms.DecimalField(
        label="Net Sales",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )
    gross_sales = forms.DecimalField(
        label="Gross Sales",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )
    liquor_sales = forms.DecimalField(
        label="Liquor Sales",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )
    order_amount = forms.DecimalField(
        label="Order Amount",
        decimal_places=0,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "1"}),
    )
    labor = forms.DecimalField(
        label="Labor",
        decimal_places=2,
        required=True,
        widget=forms.NumberInput(attrs={"class": "validate", "step": "0.01"}),
    )


class ExpensesForm(forms.Form):
    initial_date = forms.DateField(
        label="Initial Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )
    finish_date = forms.DateField(
        label="Finish Date",
        widget=forms.widgets.DateInput(attrs={"type": "date", "class": "validate"}),
    )

    restaurant = forms.ChoiceField(
        required=True,
        label="Restaurant",
        widget=forms.Select(attrs={"class": "validate"}),
    )

    suppliers = forms.ChoiceField(
        required=False,
        label="Suppliers",
        choices=(),
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
        widget=forms.NumberInput(
            attrs={"class": "validate", "placeholder": "For cash report only"}
        ),
    )

    def __init__(self, *args, **kwargs):
        supplier_choices = [(None, "-----")]
        for supplier in Supplier.objects.all().order_by("name"):
            supplier_choices.append((supplier.pk, supplier.name))

        super(ExpensesForm, self).__init__(*args, **kwargs)
        self.fields["suppliers"] = forms.ChoiceField(
            choices=supplier_choices,
            required=False,
            label="Suppliers",
            widget=forms.Select(attrs={"class": "validate"}),
        )
