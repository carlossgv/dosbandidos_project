from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path, include
from django.conf import settings #add this
from django.conf.urls.static import static #add this

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
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
