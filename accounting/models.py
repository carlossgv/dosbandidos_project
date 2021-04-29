from django.db import models
from django.db.models.deletion import CASCADE
from django.db.models.fields import CommaSeparatedIntegerField


# Create your models here.
class Supplier(models.Model):
    TYPE = (
        ("operationFood", "Operation (Food)"),
        ("operationLiquor", "Operation (Liquor)"),
        ("foodMisc", "Operation (Misc)"),
        ("liquorMisc", "Liquor (Misc)"),
        ("labor", "Labor"),
        ("service", "Service"),
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
        return f"({self.pk}) {self.name} ({self.supplierType})"


class Expense(models.Model):
    COST_CENTER = (
        ("cash", "Cash"),
        ("primaryAccount", "Primary Account"),
        ("expensesAccount", "Expenses Account"),
        ("notPaid", "Not Paid"),
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