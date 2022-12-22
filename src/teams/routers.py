
from rest_framework import routers
from .viewsets import TeamViewSet

app_name = "teams"

router = routers.DefaultRouter()
router.register('teams', TeamViewSet)