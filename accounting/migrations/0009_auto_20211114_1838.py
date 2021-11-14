# Generated by Django 3.2.8 on 2021-11-14 18:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0008_alter_metric_supplier'),
    ]

    operations = [
        migrations.AddField(
            model_name='cashlog',
            name='isChecked',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='cashlog',
            name='wasSent',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='income',
            name='supplier',
            field=models.ForeignKey(limit_choices_to={'pk__in': [68, 70, 71]}, on_delete=django.db.models.deletion.CASCADE, related_name='income_supplier_name', to='accounting.supplier'),
        ),
    ]
