from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns = [
                  path("admin/", admin.site.urls),
                  path("accounting/", include("accounting.urls")),
                  path("users/", include("users.urls")),
                  path("accounts/", include("django.contrib.auth.urls")),
                  path(
                      "",
                      auth_views.LoginView.as_view(template_name="users/login.html"),
                      name="login",
                  ),
                  path(
                      "login/",
                      auth_views.LoginView.as_view(template_name="users/login.html"),
                      name="login",
                  ),
                  path(
                      "logout/",
                      auth_views.LogoutView.as_view(template_name="users/logout.html"),
                      name="logout",
                  ),
                  path("api/", include("api.urls", namespace='api')),
                  path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
                  path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
                  path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
