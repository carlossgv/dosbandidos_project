# Generated by Django 3.2 on 2021-04-30 18:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0002_expense_restaurant'),
    ]

    operations = [
        migrations.CreateModel(
            name='CashLog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField()),
                ('cash_sales', models.DecimalField(decimal_places=2, default=0, max_digits=8)),
                ('card_auto_grat', models.DecimalField(decimal_places=2, default=0, max_digits=8)),
                ('card_tips', models.DecimalField(decimal_places=2, default=0, max_digits=8)),
                ('modifications', models.DecimalField(decimal_places=2, default=0, max_digits=8)),
                ('comments', models.TextField(blank=True)),
            ],
        ),
    ]
