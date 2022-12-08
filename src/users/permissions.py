from rest_framework import permissions

class IsUserOwnerOrGetAndPostOnly(permissions.BasePermission):
    '''Custom permissions to User Viewset to only allow edit 
    their own user, otherwise, get and post only'''

    def has_permission(self, request, view):
        return True

    def has_object_permission(self, request, view, obj):

        if request.method in permissions.SAFE_METHODS:
            return True
        
        if not request.user.is_anonymous:
            return request.user == obj
        
        return False

class IsProfileOwnerOrReadOnly(permissions.BasePermission):
    '''Custom permissions to Profile Viewset to only allow edit 
    their own profile, otherwise, get and post only'''

    def has_permission(self, request, view):
        return True

    def has_object_permission(self, request, view, obj):
        
        if request.method in permissions.SAFE_METHODS:
            return True
        
        if not request.user.is_anonymous:
            return request.user.profile == obj
        
        return False
        