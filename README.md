# pymongo-api

## Как запустить
Перейти в директорию sharding-repl-cache

Запускаем mongodb и приложение

```shell
docker compose up -d --build
```

Заполняем mongodb данными

```shell
init.ps1
```

## Как проверить

```shell
check.ps1
```

После первого обращения по адресу http://localhost:8080/helloDoc/users ответ от сервера приходит гораздо быстрее.
Так же можно проверить состояния памяти кэша командой:

```shell
docker exec -it redis redis-cli INFO memory

```

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080/docs

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080

## Доступные эндпоинты

Список доступных эндпоинтов, swagger http://<ip виртуальной машины>:8080/docs 