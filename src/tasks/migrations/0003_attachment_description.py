# Generated by Django 4.1.4 on 2022-12-24 01:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tasks', '0002_tasklist_attachment_task_task_list'),
    ]

    operations = [
        migrations.AddField(
            model_name='attachment',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
    ]