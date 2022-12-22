from django.contrib import admin
from .models import Team


class TeamAdmin(admin.ModelAdmin):
    readonly_fields = ['id', 'created_on']

admin.site.register(Team, TeamAdmin)
