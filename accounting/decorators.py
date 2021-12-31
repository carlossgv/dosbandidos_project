from functools import wraps
from django.http import HttpResponseRedirect

# Decorator to check if user is admin
# If not, redirect to home page
def admins_only(function):
    @wraps(function)
    def wrap(request, *args, **kwargs):
        user_groups = request.user.groups.all()

        if not request.user.is_staff:
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
        else:
            return function(request, *args, **kwargs)
    return wrap

# Decorator to check if user is a manager
# If not, redirect to home page
def managers_only(function):
    @wraps(function)
    def wrap(request, *args, **kwargs):
        user_groups = request.user.groups.all()

        if 'managers' in [group.name for group in user_groups]:
            return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
        else:
            return function(request, *args, **kwargs)
    return wrap
