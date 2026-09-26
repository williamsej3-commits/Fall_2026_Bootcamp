import shutil
import os


def check_resources():
    disk_threshold = 85
    load_threshold = 4.0

    total, used, free = shutil.disk_usage("/")
    disk_percent = round((used / total) * 100, 2)

    print("RESOURCE CHECK")
    print("==============")
    print(f"Disk usage: {disk_percent}%")
    print(f"Disk threshold: {disk_threshold}%")

    if disk_percent >= disk_threshold:
        print("Disk status: WARNING")
    else:
        print("Disk status: OK")

    if hasattr(os, "getloadavg"):
        one_minute_load = os.getloadavg()[0]
        print(f"One-minute load average: {one_minute_load}")

        if one_minute_load >= load_threshold:
            print("Load status: WARNING")
        else:
            print("Load status: OK")
    else:
        print("Load average: not available on this system")


check_resources()

