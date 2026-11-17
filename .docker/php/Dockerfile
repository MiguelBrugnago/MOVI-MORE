FROM php:8.3-apache

RUN apt-get update && apt-get install -y --no-install-recommends libonig-dev \
    && docker-php-ext-install pdo_mysql mbstring opcache \
    && rm -rf /var/lib/apt/lists/*

COPY .docker/php/app.ini /usr/local/etc/php/conf.d/movi.ini
COPY .docker/php/apache-performance.conf /etc/apache2/conf-available/movi-performance.conf

RUN a2enmod rewrite
RUN a2enconf movi-performance

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
