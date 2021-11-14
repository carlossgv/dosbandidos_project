# Generated by Django 3.2.8 on 2021-11-14 14:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0005_auto_20211114_1433'),
    ]

    operations = [
        migrations.AlterField(
            model_name='metric',
            name='supplier',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='metric_supplier_pk', to='accounting.supplier'),
        ),
    ]