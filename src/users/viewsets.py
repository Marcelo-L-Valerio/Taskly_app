from django.contrib.auth.models import User
from rest_framework import viewsets
from .serializers import UserSerializer
from users.permissions import IsUserOwnerOrGetAndPostOnly

class UserViewset(viewsets.ModelViewSet):

    permission_classes = [IsUserOwnerOrGetAndPostOnly,]
    queryset = User.objects.all()
    serializer_class = UserSerializer