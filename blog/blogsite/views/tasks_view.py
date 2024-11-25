# blogsite/views/tasks_view.py
from django.http import JsonResponse
from django.http import HttpResponse
from blogsite.controllers.pusher_suscribe import process_task_1
from blogsite.tasks.async_tasks import async_task_1
import asyncio

async def subscribe_view(request):
    channel = request.GET.get('channel', 'default_channel')
    response = await process_task_1(channel)
    return JsonResponse({"message": response})


def run_long_task_view(request):
    async_task_1.delay()  # Run in background
    return JsonResponse({"message": "Task started"})

