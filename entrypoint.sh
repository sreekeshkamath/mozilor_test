#!/bin/sh

# Wait for the database to be ready (optional)
while ! nc -z db 3306; do
  sleep 1
done

# Run database migrations
php artisan migrate --force

# Continue with container's main process
exec "$@"
