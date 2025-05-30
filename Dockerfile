FROM php:7.1-apache

# Instalar herramientas necesarias, extensiones PHP y habilitar mod_rewrite
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && a2enmod rewrite \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update --2.2

# Crear carpeta de trabajo
WORKDIR /var/www/html/

# Copiar composer.json
COPY composer.json ./

# Instalar dependencias PHP
RUN composer install --no-dev --prefer-dist --optimize-autoloader

# Copiar el resto de la app
COPY web/ /var/www/html/

# Copiar configuración
COPY config-dev/ /var/www/html/config-dev/
COPY config-dev/vhost.conf /etc/apache2/sites-available/000-default.conf

# Asignar permisos
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html


