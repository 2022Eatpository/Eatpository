# Generated by Django 4.0.6 on 2022-08-15 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('stores', '0002_remove_stores_phone_number_alter_stores_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='stores',
            name='phone_number',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
