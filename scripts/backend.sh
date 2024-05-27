#!/bin/bash
echo "Скрипт  (backend) запущен успешно" >> /tmp/rpm_install.log
# Установка зависимостей (если необходимо)
echo "Установка зависимостей..."
# Пример:
# sudo yum install -y java-11-openjdk-devel

# Копирование файлов
echo "Копирование файлов..."
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/Test-1.0-SNAPSHOT-jar-with-dependencies.jar /usr/local/Test/
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/backend.sh /usr/local/Test/
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/config.yml /usr/local/Test/
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/preinstall.sh /usr/local/Test/
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/postinstall.sh /usr/local/Test/
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/install.sh /usr/local/Test/
cp /root/IdeaProjects/Test/target/rpm/Test/SOURCES/uninstall.sh /usr/local/Test/

# Установка прав доступа
echo "Установка прав доступа..."
chmod +x /usr/local/Test/Test-1.0-SNAPSHOT-jar-with-dependencies.jar
chmod +x /usr/local/Test/config.yml
chmod +x /usr/local/Test/backend.sh
chmod +x /usr/local/Test/preinstall.sh
chmod +x /usr/local/Test/postinstall.sh
chmod +x /usr/local/Test/install.sh
chmod +x /usr/local/Test/uninstall.sh

# Запуск установки
echo "Запуск установки..."
/usr/local/Test/preinstall.sh

# Запуск приложения
echo "Запуск приложения..."
/usr/bin/java -jar /usr/local/Test/Test-1.0-SNAPSHOT-jar-with-dependencies.jar

echo "Скрипт  (backend) завершён успешно" >> /tmp/rpm_install.log
