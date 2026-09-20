#!/usr/bin/env bash

# Интервал между измерениями в секундах
INTERVAL=30

# Файл, в который сохраняются результаты
LOG_FILE="monitor.log"

while true; do
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        free -h
        df -h
        uptime
        echo
    } >> "$LOG_FILE"

    sleep "$INTERVAL"
done
