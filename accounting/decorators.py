from functools import wraps
from django.http import HttpResponseRedirect

# Decorator to check if user is admin
def admins_only(function):
    @wraps(function)
    def wrap(request, *args, **kwargs):
        user_groups = request.user.groups.all()

        if 'read_only_users' in [group.name for group in user_groups]:
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
        else:
            return function(request, *args, **kwargs)
    return wrap


def is_user_admin(user):
    is_admin = True
    user_groups = user.groups.all()

    if 'read_only_users' in [group.name for group in user_groups]:
        is_admin = False

    return is_admin
