from django.db import models
from django.db.models.deletion import CASCADE, PROTECT
from django.contrib.auth.models import User


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
        return f"({self.pk}) {self.name} ({self.get_supplier_type_display()})"


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
        User, on_delete=PROTECT, related_name="restaurant_expense"
    )
    supplier = models.ForeignKey(
        Supplier, related_name="expense_supplier_name", on_delete=CASCADE
    )
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    date = models.DateField()
    cost_center = models.CharField(max_length=20, choices=COST_CENTER)
    reference = models.CharField(max_length=50, blank=True)
    comments = models.TextField(blank=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.amount} paid to {self.supplier.name} ({self.supplier.pk}) on {self.date} from {self.get_cost_center_display()}"


class Income(models.Model):
    restaurant = models.ForeignKey(
        User, on_delete=PROTECT, related_name="restaurant_income"
    )
    supplier = models.ForeignKey(
        Supplier, related_name="income_supplier_name", on_delete=CASCADE
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
        User, on_delete=PROTECT, related_name="restaurant_cashlog"
    )
    date = models.DateField()
    cash_sales = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    card_auto_grat = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    card_tips = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    modifications = models.DecimalField(max_digits=8, decimal_places=2, default=0)
    comments = models.TextField(blank=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.date}: Cash Sales {self.cash_sales}, " \
               f"Card Auto Grat: {self.card_auto_grat}, " \
               f"Card Tips: {self.card_tips} "


class Metric(models.Model):
    METRIC_TYPE = (
        (77, "Order Count"),
        (76, "Gross Sales"),
        (75, "Labor"),
    )

    restaurant = models.ForeignKey(
        User, on_delete=PROTECT, related_name="restaurant_metric"
    )
    supplier = models.ForeignKey(
        Supplier,
        related_name="metric_supplier_name",
        on_delete=CASCADE,
        choices=METRIC_TYPE,
    )
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    initial_date = models.DateField(blank=True, null=True)
    date = models.DateField()
    comments = models.TextField(blank=True)
    objects = models.Manager()

    def __str__(self) -> str:
        return f"{self.restaurant__name} | {self.supplier__name} | {self.date}"
