FROM docker.arvancloud.ir/php:8.2-fpm

WORKDIR /var/www/html

RUN sed -i 's|http://deb.debian.org|http://mirror.arvancloud.ir|' /etc/apt/sources.list.d/debian.sources \
    && apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    curl \
        git \
    && docker-php-ext-configure gd \
    && docker-php-ext-install gd pdo pdo_mysql

COPY --from=docker.arvancloud.ir/composer:2.8.5 /usr/bin/composer /usr/bin/composer
COPY . .

RUN composer install --no-dev --optimize-autoloader

EXPOSE 9000

CMD ["php-fpm"]