
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .serializers import TeamSerializer
from .models import Team
from .permissions import IsTeamManagerOrNone
from django.contrib.auth.models import User


class TeamViewSet(viewsets.ModelViewSet):

    queryset = Team.objects.all()
    permission_classes = [IsTeamManagerOrNone, ]
    serializer_class = TeamSerializer

    @action(detail=True, methods=['post'], name='Join', permission_classes=[])
    def join(self, request, pk=None):
        
        try:
            team = self.get_object()
            user_profile = request.user.profile
            if user_profile.team == None:
                user_profile.team = team
                user_profile.save()
                return Response(status=status.HTTP_204_NO_CONTENT)
            elif user_profile in team.members.all():
                return Response({'detail': f'Already a member in {team} team.'}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({'detail': f'Already a member in {user_profile.team} team.'}, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    @action(detail=True, methods=['post'], name='Leave', permission_classes=[])
    def leave(self, request, pk=None):
        try:
            team = self.get_object()
            user_profile = request.user.profile
            if user_profile in team.members.all():
                user_profile.team = None
                user_profile.save()
                return Response(status=status.HTTP_204_NO_CONTENT)
            else:
                return Response({'detail': f'User not a member of {team} team.'}, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    @action(detail=True, methods=['post'], name='Remove member')
    def remove_member(self, request, pk=None):
        try:
            team = self.get_object()
            user_id = request.data.get('user_id', None)
            if user_id == None:
                return Response({'user_id': 'Not provided.'}, status=status.HTTP_400_BAD_REQUEST)
            user_profile = User.objects.get(pk=user_id).profile
            team_members = team.members
            if user_profile in team_members.all():
                team_members.remove(user_profile)
                team.save()
                return Response(status=status.HTTP_204_NO_CONTENT)
            else:
                return Response({'detail': f'User {user_profile.user} not a member of {team} team.'}, status=status.HTTP_400_BAD_REQUEST)

        except User.DoesNotExist as e:
            return Response({'detail': f'User with id {user_id} does not exists'}, status=status.HTTP_400_BAD_REQUEST)