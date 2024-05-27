#!/bin/bash
# Post-install script
echo "Скрипт post-install запущен успешно" >> /tmp/rpm_install.log

# Пример: Установка правильных разрешений на директорию установки
chown -R testuser:testuser /usr/local/Test
chmod +x /usr/local/Test/backend.sh

# Проверка наличия файла службы
if [ ! -f "/etc/systemd/system/test.service" ]; then
    echo "Создание файла службы..."
    cp /usr/local/Test-scripts/test.service /etc/systemd/system/ || { echo "Не удалось скопировать файл службы"; exit 1; }
fi

# Перезагрузка конфигурации служб systemd
echo "Перезагрузка конфигурации systemd..."
systemctl daemon-reload || { echo "Не удалось перезагрузить конфигурацию systemd"; exit 1; }

# Включение и запуск службы
echo "Включение и запуск службы..."
systemctl enable test || { echo "Не удалось включить службу"; exit 1; }
systemctl start test || { echo "Не удалось запустить службу"; exit 1; }

echo "Скрипт post-install завершён успешно" >> /tmp/rpm_install.log



