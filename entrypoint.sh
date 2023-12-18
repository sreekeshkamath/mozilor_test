#!/bin/sh

# Wait for the database to be ready (optional)
while ! nc -z db 3306; do
  sleep 1
done

# Run database migrations
php artisan migrate --force

# Start php-fpm8
exec php-fpm8 -F