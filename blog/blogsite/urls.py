from django.urls import path
from blogsite.views.views import index, individual_post, subscribe_view

from . import routes


urlpatterns = [
    path('', index, name='index'),
    path('post/', individual_post, name='individual_post'),
    path('subscribe/', subscribe_view, name='subscribe'),
    # path('', routes.urlpatterns),
]