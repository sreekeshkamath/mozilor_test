FROM alpine:3.16

# Install PHP and required extensions
RUN apk add --no-cache \
    php7 \
    php7-fpm \
    php7-pdo \
    php7-pdo_mysql \
    php7-mbstring \
    php7-exif \
    php7-pcntl \
    php7-bcmath \
    php7-gd \
    php7-xml \
    php7-zip \
    php7-curl \
    oniguruma-dev \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Set working directory
WORKDIR /var/www

# Expose port 9000 for php-fpm
EXPOSE 9000

# Start php-fpm server
CMD ["php-fpm7", "-F"]
