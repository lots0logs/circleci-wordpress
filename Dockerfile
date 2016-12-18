FROM wordpress:php5.6-fpm-alpine
MAINTAINER Elegant Themes, Inc.

RUN apk --no-cache add curl
RUN useradd -D ubuntu

##
# Install wp-cli
##
RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp-cli \
	&& chmod +rx /usr/local/bin/wp-cli

##
# Install composer
##
RUN curl -L https://getcomposer.org/installer -o composer-setup.php \
	&& php composer-setup.php \
	&& rm  composer-setup.php \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod +rx /usr/local/bin/composer \

    ##
    # Add WP coding standards with php codesniffer
    ##
    && composer create-project wp-coding-standards/wpcs:dev-master --no-interaction --no-dev /var/lib/wpcs