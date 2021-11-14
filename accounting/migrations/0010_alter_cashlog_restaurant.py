# Generated by Django 3.2.8 on 2021-11-14 18:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0009_auto_20211114_1838'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cashlog',
            name='restaurant',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='restaurant_cashlog', to='accounting.restaurant', unique_for_date='date'),
        ),
    ]
