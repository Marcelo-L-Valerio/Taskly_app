
from django.conf import settings
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static

from users import routers as users_api_router
from teams import routers as teams_api_router

auth_api_urls = [
    path(r'', include('drf_social_oauth2.urls', namespace='drf')),
]

if settings.DEBUG:
    auth_api_urls.append(path(r'verify/', include('rest_framework.urls')))

api_url_patterns = [
    path(r'auth/', include(auth_api_urls)),
    path(r'accounts/', include(users_api_router.router.urls)),
    path(r'team/', include(teams_api_router.router.urls))
]

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(api_url_patterns))
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)