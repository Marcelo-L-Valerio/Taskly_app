
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

@deconstructible
class GenerateAttachmentPathFile(object):

    def __init__(self) -> None:
        pass

    def __call__(self, instance, filename):
        ext = filename.split('.')[-1]
        path = f'media/tasks/{instance.task.id}/attachments'
        name = f'{instance.id}.{ext}'
        return os.path.join(path, name)

attachment_file_path = GenerateAttachmentPathFile()

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
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created_on = models.DateTimeField(auto_now_add=True)
    data = models.FileField(upload_to=attachment_file_path)
    task = models.ForeignKey('tasks.Task', on_delete=models.CASCADE, related_name='attachments')
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return f'{self.id} - {self.task}'