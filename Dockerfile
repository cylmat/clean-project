# build image
# ---
# use docker image: php, php:apache, node, ubuntu...

ARG IMAGE="ubuntu"
FROM ${IMAGE} AS BASE

ENV UID=1000
ENV GID=1000

RUN cat /etc/os-release

# App (run as root)
RUN apt update
RUN apt install -y curl git
RUN apt install -y \
    bzip2 \
    jq \
    procps \
    sqlite3 \
    vim \
    zip

# Copy
COPY scripts  /usr/local/scripts
COPY .recipes /usr/local/.recipes
COPY bin/install /usr/local/bin
RUN cp /usr/local/scripts/display_info_block /usr/local/bin

# Init
RUN test -f /usr/local/scripts/init_main       && bash /usr/local/scripts/init_main       || true
RUN test -f /usr/local/scripts/init_main.local && bash /usr/local/scripts/init_main.local || true

# USER
RUN echo 'root:root' | chpasswd
RUN addgroup user --gid ${GID}
RUN adduser user --uid ${UID} --gid ${GID} --gecos GECOS --disabled-password
USER user:user
RUN whoami

# Git
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

# Dir
WORKDIR /var/www
