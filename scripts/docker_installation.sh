#!/bin/bash

# Определение дистрибутива
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
else
    echo "Не удалось определить дистрибутив"
    exit 1
fi

# Обновление системы
apt update
apt upgrade -y

# Установка зависимостей
apt install -y ca-certificates curl

# Установка Docker в зависимости от дистрибутива
case $OS in
    ubuntu|debian)
        install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/$OS/gpg -o /etc/apt/keyrings/docker.asc
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/$OS $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
        ;;
    *)
        echo "Дистрибутив $OS не поддерживается этим скриптом"
        exit 1
        ;;
esac

# Обновление и установка
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Запуск Docker и добавление в автозагрузку
systemctl enable docker
systemctl start docker

# Проверка
docker --version
docker compose version
