# build image
# ---
# Use this Docker image with 
#   docker build -t project-img . --build-arg RECIPES="<recipe1> <recipe2>..."
#
# Use local recipe 
#   docker build -t project-img . --build-arg RECIPES="local/project_install"
#
# use docker image: php, php:apache, node, ubuntu...
#

ARG IMAGE="ubuntu"
ARG INSTALL_RECIPES

FROM ${IMAGE} AS BASE

RUN cat /etc/os-release

# App
RUN apt update
RUN apt install -y \
    bzip2 \
    jq \
    procps \
    sqlite3 \
    vim \
    zip

# Git @todo use a better config way
RUN apt install -y git
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

# Run
RUN cat <<EOF > /tmp/run_docker.sh
#!/usr/bin/env bash
for r in "\$@"; do cat "/tmp/.recipes/\${r}" | sh; done
EOF
COPY .recipes /tmp/.recipes
RUN chmod a+x /tmp/run_docker.sh
RUN /tmp/run_docker.sh ${INSTALL_RECIPES}

# Dir
WORKDIR /var/www