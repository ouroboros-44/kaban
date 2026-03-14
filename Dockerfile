FROM php:8.5.3-fpm-alpine

RUN apk update && \
    apk add --no-cache \
    zip \
    git  \
    postgresql-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/kaban/backend

CMD ["php-fpm"]