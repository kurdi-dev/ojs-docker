FROM serversideup/php:8.1-fpm-apache

# Setting serversideup/php ENV variables
ENV PHP_POST_MAX_SIZE="100M"
ENV PHP_UPLOAD_MAX_FILE_SIZE="100M"
ENV APACHE_DOCUMENT_ROOT="/var/www/html"
# ENV SSL_MODE="off"

# Switch to root so we can do root things
USER root

# Install the intl extension with root permissions
RUN install-php-extensions intl

# Drop back to our unprivileged user
USER www-data

# Copying OJS sourecodes
COPY --chown=www-data:www-data ./src/ /var/www/html

# Copying the edited OJS php config file
COPY --chown=www-data:www-data ./configs/config.inc.php /var/www/html/config.inc.php

# Creating the private files directory
RUN mkdir -p /var/www/files




