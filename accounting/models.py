from django.db import models
from django.db.models.deletion import CASCADE, PROTECT


class Restaurant(models.Model):
    username = models.CharField(max_length=100, unique=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    address = models.CharField(max_length=100, blank=True, null=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.pk} {self.name}"


class Supplier(models.Model):
    TYPE = (
        ("operationFood", "Food"),
        ("operationLiquor", "Liquor"),
        ("foodMisc", "Food (Miscellaneous)"),
        ("liquorMisc", "Liquor (Miscellaneous)"),
        ("labor", "Labor"),
        ("service", "Services"),
        ("uncategorized", "Uncategorized"),
    )
    name = models.CharField(max_length=100, unique=True)
    supplier_type = models.CharField(max_length=20, choices=TYPE)
    comments = models.TextField(blank=True)
    objects = models.Manager()

    class Meta:
        ordering = ["name"]

    def __str__(self) -> str:
        return f"({self.name} ({self.get_supplier_type_display()} {self.pk}))"


class Rule(models.Model):
    description = models.CharField(max_length=200, unique=True)
    supplier = models.ForeignKey(
        Supplier, related_name="rule_supplier", on_delete=CASCADE, default=100
    )
    objects = models.Manager()

    def __str__(self) -> str:
        return f"({self.pk}) '{self.description}' | Supplier: ({self.supplier.name})"


# TODO: check exact use of "related_name"
class Expense(models.Model):
    COST_CENTER = (
        ("cash", "Cash"),
        ("primaryAccount", "Primary Account"),
        ("expensesAccount", "Expenses Account"),
        ("notPaid", "Not Paid"),
        ("standBy", "Standby"),
    )
    restaurant = models.ForeignKey(
        Restaurant, on_delete=PROTECT, related_name="restaurant_expense"
    )
    supplier = models.ForeignKey(
        Supplier, related_name="expense_supplier_name", on_delete=CASCADE
    )
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    date = models.DateField()
    cost_center = models.CharField(max_length=20, choices=COST_CENTER)
    reference = models.CharField(max_length=100, blank=True)
    comments = models.TextField(blank=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.amount} paid to {self.supplier.name} ({self.supplier.pk}) on {self.date} from {self.get_cost_center_display()}"


class Income(models.Model):
    restaurant = models.ForeignKey(
        Restaurant, on_delete=PROTECT, related_name="restaurant_income"
    )
    supplier = models.ForeignKey(
        Supplier,
        related_name="income_supplier_name",
        on_delete=CASCADE,
        limit_choices_to={"pk__in": [68, 70, 71]},
    )
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    initial_date = models.DateField(null=True, blank=True)
    date = models.DateField()
    comments = models.TextField(blank=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.amount} sold from {self.supplier.name} ({self.supplier.pk}) from {self.initial_date} to {self.date})"


class CashLog(models.Model):
    restaurant = models.ForeignKey(
        Restaurant,
        on_delete=PROTECT,
        related_name="restaurant_cashlog",
        unique_for_date="date",
    )
    date = models.DateField()
    cash_sales = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    card_auto_grat = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    card_tips = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    modifications = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    comments = models.TextField(blank=True)
    isChecked = models.BooleanField(default=False)
    wasSent = models.BooleanField(default=False)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.restaurant} - {self.date}: (Checked: {self.isChecked}) (Sent: {self.wasSent})"


class Metric(models.Model):
    restaurant = models.ForeignKey(
        Restaurant, on_delete=PROTECT, related_name="restaurant_metric"
    )

    supplier = models.ForeignKey(
        Supplier,
        related_name="metric_supplier_pk",
        on_delete=CASCADE,
        limit_choices_to={"pk__in": [77, 76, 75, 74]},
    )
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    initial_date = models.DateField(blank=True, null=True)
    date = models.DateField()
    comments = models.TextField(blank=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.restaurant.name} | {self.supplier.name} | {self.date}"
