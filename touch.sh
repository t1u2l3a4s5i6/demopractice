#!/bin/bash

# Check CPU usage (simple way)
CPU=$(mpstat 1 1 | grep "Average" | awk '{print 100 - $12}')
echo "CPU usage is: $CPU%"

if [ $(echo "$CPU > 90" | bc) -eq 1 ]; then
  echo "⚠️ CPU is above 90%"
else
  echo "✅ CPU is fine"
fi

# Check disk usage
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
echo "Disk usage is: $DISK%"

if [ $DISK -ge 80 ]; then
  echo "⚠️ Disk usage is above 80%"
else
  echo "✅ Disk space is fine"
fi
   echo "user-info"
