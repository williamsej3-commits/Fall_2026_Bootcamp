import platform
import socket
import os
from datetime import datetime


def show_system_info():
    print("SYSTEM INFO")
    print("===========")
    print(f"Timestamp: {datetime.now()}")
    print(f"Hostname: {socket.gethostname()}")
    print(f"Operating system: {platform.system()}")
    print(f"OS version: {platform.version()}")
    print(f"Machine type: {platform.machine()}")
    print(f"Current user ID: {os.getuid() if hasattr(os, 'getuid') else 'not available'}")
    print(f"Current working directory: {os.getcwd()}")


show_system_info()