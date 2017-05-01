FROM wordpress:php5.6-fpm-alpine

RUN apk --no-cache add \
	curl \
	git \
	openssh \
	bash \
	unzip \
	ruby \
	parallel \
	coreutils \
	openssl

ENV \
	NGINX_VERSION=1.11.13 \
	NPM_CONFIG_LOGLEVEL=info \
	NODE_VERSION=6.10.2 \
	YARN_VERSION=0.23.2


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


EXPOSE 8080


LABEL \
	org.label-schema.schema-version="1.0" \
	org.label-schema.vendor="Elegant Themes, Inc" \
	org.label-schema.name="CircleCI WordPress" \
	org.label-schema.version="4.7.4_5.6.30_r1" \
	org.label-schema.description="Automated testing for WordPress sites using Browserstack."

