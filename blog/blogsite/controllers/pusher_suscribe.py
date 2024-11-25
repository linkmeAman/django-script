import time
from celery import shared_task
from datetime import datetime
import pytz
import asyncio

# def log_current_time():
#     while True:
#         time.sleep(5)
#         current_time = datetime.now(pytz.timezone('UTC')).strftime("%Y-%m-%d %H:%M:%S %Z%z")
#         with open("time_log.txt", "a") as log_file:
#             log_file.write(f"{current_time}\n")






@shared_task
async def process_task_1(data):
    while True:
        await asyncio.sleep(5)  # Simulate async work
        current_time = datetime.now(pytz.timezone('UTC')).strftime("%Y-%m-%d %H:%M:%S %Z%z")
        with open("time_log.log", "a") as log_file:
            log_file.write(f"{current_time}\n")

# @shared_task
# def long_running_task():
#     time.sleep(10)
#     return "Long running task completed"


# Run the logger
# if __name__ == "__main__":
    # log_current_time()
    # process_task_1()