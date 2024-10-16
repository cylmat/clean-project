#!/usr/bin/env bash

# create
symfony new symfony_project
mv symfony_project/* . && mv symfony_project/.* . && rm -r symfony_project
curl https://raw.githubusercontent.com/cylmat/symplay/refs/heads/main/public/.htaccess -o public/.htaccess

# make
cat composer.json | jq '.extra."public-dir"="public"' > /tmp/composer.json
rm composer.json && mv /tmp/composer.json .
composer req --dev maker
chmod a+w -R .
echo 'Test' | bin/console make:controller
echo 'Access test page on "http://localhost:8123/test"'
