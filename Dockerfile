FROM php:8.3-apache

#install dependencies
RUN apt update -y && apt install -y \
git \
curl \
libpng-dev \
libonig-dev \
libxml2-dev \
zip \
unzip \
libzip-dev

# install PHP Extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Enable Apache mod rewrite
RUN a2enmod rewrite

# Setup document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Create storage directories
RUN mkdir -p storage/framework/{sessions,views,cache}

# set working direktory
WORKDIR /var/www/html

# Copy Existing Application directory
COPY . .

# Set permissions
RUN chown -R www-data:www-data storage bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Install dependencies(exclude dev dependencies for production)
RUN composer install --no-dev --optimize-autoloader
