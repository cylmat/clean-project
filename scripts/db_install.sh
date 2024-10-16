#!/usr/bin/env bash

# doctrine
composer req doctrine --no-interaction
sed -ie 's/DATABASE_URL="postgresql/# DATABASE_URL="postgresql/' .env
sed -ie 's/# DATABASE_URL="sqlite/DATABASE_URL="sqlite/' .env

# form
composer require form validator twig-bundle security-csrf
echo 'Use bin/console make:entity or bin/console make:crud'
