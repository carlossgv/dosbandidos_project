# Generated by Django 3.2.8 on 2021-11-14 14:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0006_alter_metric_supplier'),
    ]

    operations = [
        migrations.AlterField(
            model_name='metric',
            name='supplier',
            field=models.ForeignKey(limit_choices_to={'pk__in': [77, 76, 75]}, on_delete=django.db.models.deletion.CASCADE, related_name='metric_supplier_pk', to='accounting.supplier'),
        ),
    ]
