# Generated by Django 3.2.4 on 2021-07-24 16:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0006_auto_20210506_1912'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='expense',
            name='isCheck',
        ),
        migrations.RemoveField(
            model_name='expense',
            name='isPaid',
        ),
    ]
