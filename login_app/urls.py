from django.urls import path

from . import views

urlpatterns = [
    # path("signup/", views.signup, name="signup"),
    # path("signin/", views.signin, name="signin"),
    path('signup/', views.SignupView.as_view(), name='signup'),
    path('signin/', views.SignInView.as_view(), name='signin'),
    path('me/', views.MeView.as_view(), name='me'),
]