# build image
# ---
# Use this Docker image with 
#   docker build -t project-img . --build-arg RECIPES="<recipe1> <recipe2>..."
#
# Use local recipe 
#   docker build -t project-img . --build-arg RECIPES="custom/project_install"
#
# use docker image
# ---
# php, node, ubuntu
# php:apache
#
FROM php:apache

RUN cat /etc/os-release

ARG RECIPES

# app
RUN apt update

# run
RUN cat <<EOF > /tmp/run_docker.sh
#!/usr/bin/env bash
for r in "\$@"; do cat "/tmp/recipes/\${r}" | sh; done
EOF
COPY .recipes /tmp/recipes
RUN chmod a+x /tmp/run_docker.sh
RUN /tmp/run_docker.sh ${RECIPES}

# dir
WORKDIR /var/www
