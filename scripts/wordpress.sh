#!/bin/bash

set -e

adduser -D ubuntu

##
# Make sure db container has time to startup
##
sed -i 's|#!/bin/bash|&\nsleep 10|g' /usr/local/bin/docker-entrypoint.sh

##
# Install wp-cli
##
curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp-cli \
	&& chmod +rx /usr/local/bin/wp-cli

##
# Install composer
##
curl -L https://getcomposer.org/installer -o composer-setup.php \
	&& php composer-setup.php \
	&& rm  composer-setup.php \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod +rx /usr/local/bin/composer

##
# Add WP coding standards with php codesniffer
##
composer create-project wp-coding-standards/wpcs:dev-master --no-interaction --no-dev /var/lib/wpcs
ln -s /var/lib/wcs/vendor/bin/phpcs /usr/bin/phpcs

##
# Start Nginx before PHP-FPM
##
sed -i 's|exec "$@"|nginx \&\n&|g' /usr/local/bin/docker-entrypoint.sh

##
# Make sure our non-root user can read/write in the wordpress directory
##
chmod a+rw /var/www/html

