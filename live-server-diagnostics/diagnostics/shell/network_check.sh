#!/usr/bin/env bash

TARGET_HOST="${1:-localhost}"

echo "NETWORK CHECK"
echo "============="
echo "Target host: $TARGET_HOST"
echo

if ping -c 2 "$TARGET_HOST" > /tmp/network_check_ping.txt 2>&1
then
    echo "Ping status: OK"
else
    echo "Ping status: FAILED"
fi

echo
cat /tmp/network_check_ping.txt
rm -f /tmp/network_check_ping.txt

