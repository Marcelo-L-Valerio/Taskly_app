
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver

from .models import Task, COMPLETE, NOT_COMPLETE

@receiver(post_save, sender=Task)
def update_team_points(sender, instance, created, **kwargs):
    team = instance.task_list.team
    if instance.status == COMPLETE:
        team.points += 10
    elif instance.status == NOT_COMPLETE:
        if team.points > 10:
            team.points -= 10
    team.save()

@receiver(post_save, sender=Task)
def update_task_list_status(sender, instance, created, **kwargs):
    task_list = instance.task_list
    is_complete = True
    for task in task_list.tasks.all():
        if task.status != COMPLETE:
            is_complete = False
            break
    task_list.status = COMPLETE if is_complete else NOT_COMPLETE
    task_list.save()