FROM php:8.0-fpm

# Chromium and ChromeDriver
ENV PANTHER_NO_SANDBOX 1
# Not mandatory, but recommended
ENV PANTHER_CHROME_ARGUMENTS='--disable-dev-shm-usage'

RUN apt-get update && apt-get install -y wget git unzip zip libicu-dev libzip-dev \
    chromium \
    && pecl install xdebug  && docker-php-ext-enable xdebug

# install chromedriver
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

RUN docker-php-ext-configure intl
RUN docker-php-ext-install pdo_mysql intl zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN wget --no-check-certificate https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

ADD ./php.ini /usr/local/etc/php/php.ini

# Add user for  application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/sh -g www www
# Copy existing application directory permissions
COPY --chown=www:www . /var/www
# Change current user to www
USER www

WORKDIR /var/www