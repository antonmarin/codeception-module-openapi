ARG PHP_VERSION
FROM antonmarin/php:$PHP_VERSION-alpine-cli
RUN apk add --no-cache zip zlib-dev libzip-dev && \
	docker-php-ext-install zip
