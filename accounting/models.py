from django.db import models
from django.db.models.deletion import CASCADE, PROTECT
from django.contrib.auth.models import User

# Create your models here.
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
    supplierType = models.CharField(max_length=20, choices=TYPE)
    isFixedExpense = models.BooleanField(default=False)
    hasCredit = models.BooleanField(default=False)
    comments = models.TextField(blank=True)

    class Meta:
        ordering = ["name"]

    def __str__(self) -> str:
        return f"({self.pk}) {self.name} ({self.get_supplierType_display()})"


class Expense(models.Model):
    COST_CENTER = (
        ("cash", "Cash"),
        ("primaryAccount", "Primary Account"),
        ("expensesAccount", "Expenses Account"),
        ("notPaid", "Not Paid"),
    )
    restaurant = models.ForeignKey(
        User, on_delete=PROTECT, related_name="restaurant_expense"
    )
    supplier = models.ForeignKey(
        Supplier, related_name="supplier_name", on_delete=CASCADE
    )
    amount = models.DecimalField(max_digits=8, decimal_places=2)
    date = models.DateField()
    costCenter = models.CharField(max_length=20, choices=COST_CENTER)
    isPaid = models.BooleanField(default=True)
    isCheck = models.BooleanField(default=False)
    reference = models.CharField(max_length=50, blank=True)
    comments = models.TextField(blank=True)

    def __str__(self) -> str:
        return f"{self.amount} paid to {self.supplier.name} ({self.supplier.pk}) on {self.date} from {self.get_costCenter_display()}"


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

    def __str__(self) -> str:
        return f"{self.date}: Cash Sales {self.cash_sales}, Card Auto Grat: {self.card_auto_grat}, Card Tips: {self.card_tips}"