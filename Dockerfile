# use docker image
# php, php:apache, node, ubuntu
FROM php:apache

ARG RECIPES

# app
# RUN apt update && apt install -y git jq sqlite3 vim zip
# RUN git config --global user.email 'you@example.com'
# RUN git config --global user.name 'Your Name'

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
