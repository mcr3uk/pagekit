# pagekit

> Pagekit with docker blueprint with php7 fpm running alpine linux

## Usage

Use docker-compose (sqlite)

```yaml
version: '2'

services:
  nginx:
    image: nginx:1.15-alpine
    ports:
      - '8080:80'
    volumes:
      - ./pagekit:/pagekit
      - ./site.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - pagekit
  pagekit:
    image: mcr3/pagekit:latest
    volumes:
      - ./pagekit:/pagekit
```

If you want to use MySQL, add MySQL service:

```yaml
version: '2'

services:
  nginx:
    image: nginx:1.15-alpine
    ports:
      - '8080:80'
    volumes:
      - ./src:/src
      - ./site.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - pagekit
  pagekit:
    image: mcr3/pagekit:latest
    volumes:
      - ./pagekit:/pagekit
    depends_on:
      - db
  db:
    image: mysql
    expose:
      - '3306'
    environment:
      - MYSQL_ROOT_PASSWORD=MYSQLPASSWORD
      - MYSQL_DATABASE=pagekit
    volumes:
      - ./mysql:/var/lib/mysql
```

## Pre-installed dependencies

- php7-json
- php7-session
- php7-ctype
- php7-tokenizer
- php7-simplexml
- php7-dom
- php7-mbstring
- php7-zip
- php7-pdo_mysql
- pcre
- zlib-dev
- libzip-dev
- zip
