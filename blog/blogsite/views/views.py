from django.http import JsonResponse
from django.http import HttpResponse
from django.shortcuts import render
from blogsite.controllers.pusher_suscribe import process_task_1
from blogsite.tasks.async_tasks import async_task_1
import asyncio


def index(request):
    return HttpResponse("Hello, welcome to the index page.")

def individual_post(request):
    return HttpResponse("This is where an individual post will be.")



async def subscribe_view(request):
    channel = request.GET.get('channel', 'default_channel')
    response = await process_task_1(channel)
