#!/bin/bash

echo " System Health Check "

# Check disk usage
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Disk Usage: $DISK%"

if [ "$DISK" -gt 80 ]; then
    echo "Warning: Disk usage is high!"
else
    echo "Disk usage is normal."
fi

# Check current user
USER_NAME=$(whoami)
echo "Logged in user: $USER_NAME"

# Check current date and time
DATE_TIME=$(date)
echo "Current date and time: $DATE_TIME"

echo " Check Complete "
