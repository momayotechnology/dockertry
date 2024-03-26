FROM php:8.2.0-apache
WORKDIR /var/www/html

#mod rewrite
RUN a2enmod rewrite

#install Linux library for php
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev 

#composer Image call and install
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#php Extension
RUN docker-php-ext-install gettext intl pdo_mysql gd
