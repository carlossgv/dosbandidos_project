# Generated by Django 3.2.4 on 2021-09-12 21:20

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0010_auto_20210912_0003'),
    ]

    operations = [
        migrations.RenameField(
            model_name='expense',
            old_name='costCenter',
            new_name='cost_center',
        ),
        migrations.RenameField(
            model_name='income',
            old_name='initial_date',
            new_name='initial_date',
        ),
        migrations.RenameField(
            model_name='metric',
            old_name='initial_date',
            new_name='initial_date',
        ),
    ]