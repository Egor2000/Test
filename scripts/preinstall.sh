#!/bin/bash
echo "Скрипт установки (preinstall) запущен успешно" >> /tmp/rpm_install.log

# Pre-install script
echo "Running pre-install script..."

# Пример: Создание пользователя или группы, если это необходимо
if ! id "testuser" &>/dev/null; then
    useradd -r -s /bin/false testuser
fi

echo "Скрипт установки (preinstall) завершён успешно" >> /tmp/rpm_install.log