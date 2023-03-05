FROM wyveo/nginx-php-fpm:php81
COPY composer.json /usr/share/nginx
COPY composer.lock /usr/share/nginx

RUN chown -R nginx:nginx /usr/share/nginx

WORKDIR /usr/share/nginx
USER nginx
RUN composer install --no-dev --no-scripts --no-autoloader && \
    composer dump-autoload --optimize
USER root