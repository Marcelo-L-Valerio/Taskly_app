from celery import shared_task

from .models import Team
from tasks.models import COMPLETE

@shared_task
def calculate_house_stats():

  print(Team.objects.count())
  # print(Team.objects.all())

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
    print(team.completed_tasks_count)
