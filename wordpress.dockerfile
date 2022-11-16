FROM php:8.1.12-fpm-alpine

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

COPY entrypoint.sh /

WORKDIR /

ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["php-fpm"]