from celery import shared_task
import time

@shared_task
def async_task_1(data):
    time.sleep(5)  # Simulate some work
    return f"Task 1 completed with data: {data}"
