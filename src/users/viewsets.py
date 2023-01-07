from django.contrib.auth.models import User

from oauth2_provider.contrib.rest_framework import OAuth2Authentication
from rest_framework import viewsets, mixins, authentication

from .serializers import UserSerializer, ProfileSerializer
from users.permissions import IsUserOwnerOrGetAndPostOnly, IsProfileOwnerOrReadOnly
from .models import Profile

class ProfileViewset(viewsets.GenericViewSet, mixins.RetrieveModelMixin, mixins.UpdateModelMixin):

    permission_classes = [IsProfileOwnerOrReadOnly,]
    authentication_classes = [OAuth2Authentication, authentication.SessionAuthentication]
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer
    

class UserViewset(viewsets.ModelViewSet):

    permission_classes = [IsUserOwnerOrGetAndPostOnly,]
    authentication_classes = [OAuth2Authentication, authentication.SessionAuthentication]
    queryset = User.objects.all()
    serializer_class = UserSerializer