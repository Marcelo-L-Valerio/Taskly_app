
from django.db import models
import os
import uuid
from django.utils.deconstruct import deconstructible

def team_image_file_path(instance, filename):
    ext = os.path.splitext(filename)[1]
    filename = f'{uuid.uuid4()}{ext}'

    return os.path.join('uploads', 'teams', filename)

class Team(models.Model):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=128)
    image = models.FileField(upload_to=team_image_file_path, blank=True, null=True)
    created_on = models.DateTimeField(auto_now_add=True)
    description = models.TextField()
    manager = models.OneToOneField(
        'users.Profile', on_delete=models.SET_NULL, blank=True, null=True, related_name='managed_team'
        )
    points = models.IntegerField(default=0)
    completed_tasks_count = models.IntegerField(default=0)
    notcompleted_tasks_count = models.IntegerField(default=0)

    def __str__(self):
        return f'{self.id} - {self.name}'