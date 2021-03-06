# Generated by Django 3.2.8 on 2021-11-14 02:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounting', '0002_restaurant'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='address',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='username',
            field=models.CharField(default='default', max_length=100, unique=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='name',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
