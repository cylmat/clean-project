# build image
# ---
# use docker image: php, php:apache, node, ubuntu...

ARG IMAGE="ubuntu"
FROM ${IMAGE} AS BASE

RUN cat /etc/os-release

# App
RUN apt update
RUN apt install -y \
    bzip2 \
    curl
#     jq \
#     procps \
#     sqlite3 \
#     vim \
#     zip

# Git
# RUN apt install -y git
# RUN git config --global user.email "you@example.com"
# RUN git config --global user.name "Your Name"

# Init
COPY .recipes /usr/local/.recipes
RUN chmod a+x /usr/local/.recipes
RUN if test -f /usr/local/.recipes/init_main_recipes.local; then sh /usr/local/.recipes/init_main_recipes.local; fi

# Dir
WORKDIR /var/www