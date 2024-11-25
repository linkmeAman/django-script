# import time
# from datetime import datetime
# import pytz

# def log_current_time():
#     while True:
#         time.sleep(5)
#         current_time = datetime.now(pytz.timezone('UTC')).strftime("%Y-%m-%d %H:%M:%S %Z%z")
#         with open("time_log.txt", "a") as log_file:
#             log_file.write(f"{current_time}\n")


# # Run the logger
# if __name__ == "__main__":
#     log_current_time()
