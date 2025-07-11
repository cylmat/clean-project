# Clean installation project

Clean installed directory for a new development project

## Clone and install project

```shell
git clone https://github.com/cylmat/clean-project my_project
cd my_project
rm .git -rf
```

* Up docker containers
```shell
docker compose --env-file .env --env-file .env.local up --build -d
docker compose down --remove-orphans
  or
make up
make down
make restart
```

### MERN (Mongo, Express, React, Node.js)

* Uncomment docker compose in compose.override.yml.local
```
include:
    - .docker/compose/node.yml
    - .docker/compose/db/mongo.yml
```

* Up docker containers
```shell
make up
```

* Run install script to help creating project
```shell
export UID=$(id -u)
export GID=$(id -g)
./bin/install mern-stack node
```

* Run container's server for node
```shell
make mern-backend
make mern-frontend
make mern-fixtures
```

### Symfony React

* Uncomment docker compose in compose.override.yml.local
```
include:
    - .docker/compose/node.yml
    - .docker/compose/php-apache.yml
    - .docker/compose/db/mysql.yml
```

* Up docker containers
```shell
make up
```

* Run install script to help creating project
```shell
export UID=$(id -u)
export GID=$(id -g)
./bin/install symfony-stack php-apache
```

## Custom recipe

- Just rename .recipes/custom.local.dist to custom.local, or create new one
- Run it with "./bin/install custom.local"

### As root

To use "docker -u root" to run recipes, add at the begining of the script so the /bin/install script can parse it:
```
#@AS_ROOT#
```

## Stack recipe

Stack recipe run on the host instead of "/tmp" directory in docker container.  
Just put the recipe inside a "stack" directory, or name with "stack" in the recipe name.

- .recipes/node/create/express-app: run with docker exec container_name sh -c "/tmp/.recipes/node/create/express-app"
- .recipes/php/stack/symfony-stack: run with sh -c ".recipes/php/stack/symfony-stack"

## Docs

Front
- https://getbootstrap.com
- https://gulpjs.com

Node
- https://expressjs.com
- https://nextjs.org
- https://vuejs.org

Back
- https://slimframework.com
