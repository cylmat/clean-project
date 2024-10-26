# build image
# ---
# Use this Docker image with 
#   docker build -t project-img . --build-arg RECIPES="<recipe1> <recipe2>..."
#
# Use local recipe 
#   docker build -t project-img . --build-arg RECIPES="local/project_install"
#
# use docker image
# ---
# php, node, ubuntu
# php:apache
#
ARG IMAGE="ubuntu"
ARG RECIPES

FROM ${IMAGE} AS BASE

RUN cat /etc/os-release

# app
RUN apt update
RUN apt install -y zip

# run
RUN cat <<EOF > /tmp/run_docker.sh
#!/usr/bin/env bash
for r in "\$@"; do cat "/tmp/recipes/\${r}" | sh; done
EOF
COPY .recipes /tmp/recipes
RUN chmod a+x /tmp/run_docker.sh
RUN /tmp/run_docker.sh ${RECIPES}

# Http
# EXPOSE 80

# dir
WORKDIR /var/www
