#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys
import threading  # Import threading to run the logger in the background
from blog.time_logger import log_current_time  # Import the logger function

def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'blog.settings')

    # Start the logging thread
    logging_thread = threading.Thread(target=log_current_time, daemon=True)
    logging_thread.start()

    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)

if __name__ == '__main__':
    main()
