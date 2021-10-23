from django.test import TestCase, Client
from accounting.decorators import admins_only
from accounting.models import User

class TestDecorators(TestCase):
    def setUp(self):
        self.client = Client()
        self.super_user = User.objects.create_superuser('admin', 'admin@myproject.com', 'password')

    # TODO: Test the admins_only decorator    
    def xtest_check_if_user_is_admin(self):
        
        self.client.login(username='admin', password='password')

        @admins_only
        def test_function(request):
            return True

        self.assertTrue(test_function(request=self.client))