# build image
# ---
# use docker image: php, php:apache, node, ubuntu...

ARG IMAGE="ubuntu"
FROM ${IMAGE} AS BASE

RUN cat /etc/os-release

# App
RUN apt update
RUN apt install -y curl

RUN apt install -y \
    bzip2 \
    jq \
    procps \
    sqlite3 \
    vim \
    zip

# # Git
RUN apt install -y git
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

# Init
COPY .recipes /usr/local/.recipes
COPY scripts  /usr/local/scripts
RUN chmod a+x /usr/local/.recipes /usr/local/scripts
RUN cp /usr/local/scripts/display_info_block /usr/local/bin
RUN test -f /usr/local/scripts/init_main       && bash /usr/local/scripts/init_main       || true
RUN test -f /usr/local/scripts/init_main.local && bash /usr/local/scripts/init_main.local || true

# Dir
WORKDIR /var/www