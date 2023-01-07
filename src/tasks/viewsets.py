
from rest_framework import viewsets, mixins, response, filters, authentication
from rest_framework import status as stt

from .serializers import TaskListSerializer, TaskSerializer, AttachmentSerializer

from .models import Task, TaskList, Attachment
from .models import COMPLETE, NOT_COMPLETE

from django_filters.rest_framework import DjangoFilterBackend
from oauth2_provider.contrib.rest_framework import OAuth2Authentication
from .permissions import IsAllowedToEditTaskListElseNone, IsAllowedToEditTaskElseNone, IsAllowedToEditAttachmentElseNone

from rest_framework.decorators import action
from django.utils import timezone

class TaskListViewSet(mixins.CreateModelMixin, mixins.RetrieveModelMixin,
                        mixins.UpdateModelMixin, mixins.DestroyModelMixin,
                        # mixins.ListModelMixin,
                        viewsets.GenericViewSet):

    permission_classes = [IsAllowedToEditTaskListElseNone, ]
    authentication_classes = [OAuth2Authentication, authentication.SessionAuthentication]
    queryset = TaskList.objects.all()
    serializer_class = TaskListSerializer

class TaskViewSet(viewsets.ModelViewSet):

    permission_classes = [IsAllowedToEditTaskElseNone, ]
    authentication_classes = [OAuth2Authentication, authentication.SessionAuthentication]
    queryset = Task.objects.all()
    serializer_class = TaskSerializer
    filter_backends = [ filters.SearchFilter, DjangoFilterBackend]
    search_fields = ['name', 'status']
    filterset_fields = ['status',]

    def get_queryset(self):
        queryset = super(TaskViewSet, self).get_queryset()
        user_profile = self.request.user.profile
        updated_queryset = queryset.filter(created_by=user_profile)
        return updated_queryset
    
    @action(detail=True, methods=['patch'])
    def update_task_status(self, request, pk=None):
        try:
            task = self.get_object()
            profile = request.user.profile
            status = request.data['status']

            if status == NOT_COMPLETE:
                if task.status == COMPLETE:
                    task.status = NOT_COMPLETE
                    task.completed_on = None
                    task.completed_by = None
                else:
                    raise Exception('Task is already marked as not completed.')

            elif status == COMPLETE:
                if task.status == NOT_COMPLETE:
                    task.status = COMPLETE
                    task.completed_on = timezone.now()
                    task.completed_by = profile
                else:
                    raise Exception('Task is already marked as completed.')

            else:
                raise Exception('Not valid status provided.')

            task.save()
            serializer = TaskSerializer(instance=task, context={'request': request})
            return response.Response(serializer.data, status=stt.HTTP_200_OK)
        except Exception as e:
            return response.Response({'detail': str(e)}, status=stt.HTTP_400_BAD_REQUEST)

class AttachmentViewSet(mixins.CreateModelMixin, mixins.RetrieveModelMixin,
                        mixins.UpdateModelMixin, mixins.DestroyModelMixin,
                        #mixins.ListModelMixin, 
                        viewsets.GenericViewSet):

    permission_classes = [IsAllowedToEditAttachmentElseNone, ]
    authentication_classes = [OAuth2Authentication, authentication.SessionAuthentication]
    queryset = Attachment.objects.all()
    serializer_class = AttachmentSerializer