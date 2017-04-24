FROM wordpress:php5.6-fpm-alpine

RUN apk --no-cache add curl git openssh bash unzip ruby parallel shadow

ENV \
	NGINX_VERSION=1.11.13 \
	NPM_CONFIG_LOGLEVEL=info \
	NODE_VERSION=6.10.2 \
	YARN_VERSION=0.23.2 \
	RUBY_MAJOR=2.4 \
	RUBY_VERSION=2.4.1 \
	RUBY_DOWNLOAD_SHA256=4fc8a9992de3e90191de369270ea4b6c1b171b7941743614cc50822ddc1fe654 \
	RUBYGEMS_VERSION=2.6.11 \
	BUNDLER_VERSION=1.14.6


##
# NodeJS
##
ADD scripts/nodejs.sh /bin/
RUN nodejs.sh


##
# Nginx
##
ADD scripts/nginx.sh /bin/
ADD config/*.conf /tmp/
RUN nginx.sh


##
# WordPress
##
ADD scripts/wordpress.sh /bin/
RUN wordpress.sh


EXPOSE 80 443

LABEL \
	org.label-schema.schema-version="1.0" \
	org.label-schema.vendor="Elegant Themes, Inc" \
	org.label-schema.name="CircleCI WordPress" \
	org.label-schema.version="4.7.3_5.6.30" \
	org.label-schema.description="Automated testing for WordPress sites using Browserstack."

