#!/bin/bash

echo "Скрипт uninstall запущен успешно" >> /tmp/rpm_install.log
# Проверка наличия службы перед остановкой
if systemctl status test &> /dev/null; then
    /usr/bin/systemctl stop test || true
fi

# Проверка наличия службы перед отключением
if systemctl is-enabled test &> /dev/null; then
    /usr/bin/systemctl disable test || true
fi

echo "Скрипт uninstall завершён успешно" >> /tmp/rpm_install.log
