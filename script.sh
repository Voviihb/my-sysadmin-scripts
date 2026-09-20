#!/usr/bin/env bash

# Интервал между измерениями в секундах
INTERVAL=30

# Файл, в который сохраняются результаты
LOG_FILE="monitor.log"

stop_monitoring() {
    echo
    echo "Мониторинг остановлен."
    exit 0
}

trap stop_monitoring INT TERM

if ! touch "$LOG_FILE"; then
    echo "Ошибка: не удалось открыть '$LOG_FILE' для записи." >&2
    exit 1
fi

echo "Мониторинг запущен. Результаты сохраняются в $LOG_FILE"

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
