#!/bin/bash
echo "Скрипт install запущен успешно" >> /tmp/rpm_install.log

# Проверка существования каталога перед копированием файла службы
if [ ! -d "/etc/systemd/system/" ]; then
    echo "Создаю каталог /etc/systemd/system/"
    mkdir -p /etc/systemd/system/ || { echo "Не удалось создать каталог"; exit 1; }
fi

# Копирование файла службы
echo "Копирование файла службы..."
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/test.service /etc/systemd/system/ || { echo "Не удалось скопировать файл службы"; exit 1; }

# Перезагрузка конфигурации служб systemd
echo "Перезагрузка конфигурации systemd..."
systemctl daemon-reload || { echo "Не удалось перезагрузить конфигурацию systemd"; exit 1; }

# Включение и запуск службы
echo "Включение и запуск службы..."
systemctl enable test || { echo "Не удалось включить службу"; exit 1; }
systemctl start test || { echo "Не удалось запустить службу"; exit 1; }

echo "Скрипт install завершён успешно" >> /tmp/rpm_install.log
