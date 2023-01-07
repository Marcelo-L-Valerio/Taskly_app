from celery import shared_task

from .models import Team
from tasks.models import COMPLETE

@shared_task(name = "calculate_house_stats")
def calculate_house_stats():

  for team in Team.objects.all():
    total_tasks = 0
    completed_tasks = 0
    team_task_lists = team.lists.all()

    for task_list in team_task_lists:
        total_tasks += task_list.tasks.count()
        completed_tasks += task_list.tasks.filter(status=COMPLETE).count()
        
    team.completed_tasks_count = completed_tasks
    team.notcompleted_tasks_count = total_tasks - completed_tasks
    team.save()
