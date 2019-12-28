FROM php:fpm-alpine
RUN apk --no-cache add shadow
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY config/*.ini $PHP_INI_DIR/conf.d/
RUN usermod -u 101 www-data; groupmod -g 101 www-data;
COPY source /usr/src/api
RUN mkdir /usr/src/api/uploads;chmod g+w /usr/src/api/uploads; chown root:www-data /usr/src/api/uploads
WORKDIR /usr/src/
