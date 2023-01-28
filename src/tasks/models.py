
import uuid
import os
from django.db import models
from django.utils.deconstruct import deconstructible

TASK_STATUS = [
    ('NC',  'Not completed'),
    ('C', 'Completed')
]
COMPLETE = TASK_STATUS[1][0]
NOT_COMPLETE = TASK_STATUS[0][0]

def attachment_image_file_path(instance, filename):
    ext = os.path.splitext(filename)[1]
    filename = f'{uuid.uuid4()}{ext}'

    return os.path.join('uploads', 'attachments', filename)

class TaskList(models.Model):
    created_on = models.DateTimeField(auto_now_add=True)
    completed_on = models.DateTimeField(null=True, blank=True)
    created_by = models.ForeignKey(
        'users.Profile', null=True, blank=True, on_delete=models.SET_NULL, related_name='lists')
    team = models.ForeignKey('teams.Team', on_delete=models.CASCADE, related_name='lists')
    name = models.CharField(max_length=120)
    description = models.TextField(null=True, blank=True)
    status = models.CharField(max_length=2, choices=TASK_STATUS, default='NC')

    def __str__(self):
        return f'{self.id} - {self.name}'

class Task(models.Model):
    created_on = models.DateTimeField(auto_now_add=True)
    completed_on = models.DateTimeField(null=True, blank=True)
    created_by = models.ForeignKey(
        'users.Profile', null=True, blank=True, on_delete=models.SET_NULL, related_name='createde_tasks')
    completed_by = models.ForeignKey(
        'users.Profile', null=True, blank=True, on_delete=models.SET_NULL, related_name='completed_tasks')
    task_list = models.ForeignKey('tasks.TaskList', on_delete=models.CASCADE, related_name='tasks')
    name = models.CharField(max_length=120)
    description = models.TextField(null=True, blank=True)
    status = models.CharField(max_length=2, choices=TASK_STATUS, default='NC')

    def __str__(self):
        return f'{self.id} - {self.name}'

class Attachment(models.Model):
    created_on = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(null=True, upload_to=attachment_image_file_path)
    task = models.ForeignKey('tasks.Task', on_delete=models.CASCADE, related_name='attachments')
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return f'{self.id} - {self.task}'