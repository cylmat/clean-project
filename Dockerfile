FROM php:apache

# app
RUN apt update && apt install -y git jq sqlite3 vim zip
RUN git config --global user.email 'you@example.com'
RUN git config --global user.name 'Your Name'

# composer
RUN curl -sS https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/composer-install.sh | bash
RUN mv ./composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

# symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# apache
RUN sed -ie 's#/var/www/html#/var/www/public#' /etc/apache2/sites-enabled/000-default.conf
RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
RUN . /etc/apache2/envvars

# dir
WORKDIR /var/www
