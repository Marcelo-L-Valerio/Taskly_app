
from django.db import models
from django.contrib.auth.models import User
from django.utils.deconstruct import deconstructible
import os
import uuid

def profile_image_file_path(instance, filename):
    ext = os.path.splitext(filename)[1]
    filename = f'{uuid.uuid4()}{ext}'

    return os.path.join('uploads', 'profiles', filename)

class Profile(models.Model):

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.FileField(upload_to=profile_image_file_path, blank=True, null=True)
    team = models.ForeignKey('teams.Team', on_delete=models.SET_NULL, null=True, blank=True, related_name='members')

    def __str__(self):
        return f'{self.id} - {self.user.username}\'s Profile'