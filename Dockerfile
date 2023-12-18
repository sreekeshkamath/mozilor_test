# Use Alpine 3.18 as base image
FROM alpine:3.16

# Install PHP 8 and required extensions
RUN apk update && apk add --no-cache \
    openrc \
    php8 \
    php8-fpm \
    php8-pdo \
    php8-pdo_mysql \
    php8-mbstring \
    php8-exif \
    php8-pcntl \
    php8-bcmath \
    php8-gd \
    php8-xml \
    php8-zip \
    php8-curl \
    php8-phar \
    php8-json \
    php-dom \
    php-fileinfo \
    php-tokenizer \
    php-xmlwriter \
    oniguruma-dev \
    libpng-dev \
    libxml2-dev \
    php8-session\
    zip \
    unzip \
    git \
    iproute2 \
    curl

RUN addgroup -S -g 1000 mozilorgroup

RUN adduser -S -G mozilorgroup -u 1000 mozilor

COPY www.conf /etc/php8/php-fpm.d/

COPY php.ini /etc/php8/

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set working directory
WORKDIR /var/www

RUN chown -R 1000:1000 /var/www/

# Expose port 9000 for php-fpm
EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]

