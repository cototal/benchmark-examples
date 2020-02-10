FROM cototal/php-apache:fa16413

COPY container/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY container/apache2.conf /etc/apache2/apache2.conf
COPY container/php.ini $PHP_INI_DIR/php.ini

COPY . /app
