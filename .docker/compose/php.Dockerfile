ARG IMAGE=php

FROM ${IMAGE}

ARG UID=1000
ARG GID=1000



RUN apt update

RUN apt install -y \
    build-essential \
    gcc \
    make

RUN apt install -y \
    curl \
    wget \
    vim \
    zip


USER root

###############
# Install git #
###############
# https://git-scm.com


RUN apt install -y git

ENV GIT_CONFIGURE=0
ENV GIT_USER_NAME="Your Name"
ENV GIT_USER_EMAIL="you@example.com"

RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

RUN git --version


####################
# Install composer #
####################
# https://getcomposer.org


RUN cd /tmp
RUN curl -sS https://raw.githubusercontent.com/cylmat/docs/refs/heads/main/install/script/composer-install.sh | bash
RUN mv ./composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

RUN composer --version

#######################
# Install symfony-cli #
#######################
# https://symfony.com/download


RUN cd /tmp
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv $HOME/.symfony5/bin/symfony /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

RUN symfony -V



# USER init #

# debian-like
RUN addgroup user --gid "${GID}" && adduser user --uid "${UID}" --gid "${GID}" --gecos GECOS --disabled-password

# linux-like
# RUN groupadd --gid "${GID}" user && useradd --uid "${UID}" --gid "${GID}" --create-home --shell /bin/bash user

USER user


WORKDIR /var/www
