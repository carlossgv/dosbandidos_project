# Generated by Django 3.2.4 on 2021-09-12 00:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0009_auto_20210822_0048'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='supplier',
            name='hasCredit',
        ),
        migrations.RemoveField(
            model_name='supplier',
            name='isFixedExpense',
        ),
        migrations.AlterField(
            model_name='expense',
            name='costCenter',
            field=models.CharField(choices=[('cash', 'Cash'), ('primaryAccount', 'Primary Account'), ('expensesAccount', 'Expenses Account'), ('notPaid', 'Not Paid'), ('standBy', 'Standby')], max_length=20),
        ),
    ]