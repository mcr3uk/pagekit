FROM php:7.3-fpm-alpine

RUN apk update

# Required dependencies for Pagekit
RUN apk add php7-json php7-session php7-ctype 
RUN apk add php7-tokenizer php7-simplexml php7-dom
RUN apk add php7-mbstring php7-zip php7-pdo_mysql
RUN apk add pcre

RUN apk add zlib-dev
RUN apk add libzip-dev

RUN docker-php-ext-install zip

COPY ./pagekit/ /pagekit/

VOLUME ["/pagekit/storage", "pagekit"]

EXPOSE 80/tcp