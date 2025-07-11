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
./bin/install mern node
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
./bin/install_root git php-apache
./bin/install_root composer php-apache
./bin/install_root symfony-cli php-apache
./bin/install symfony php-apache
```

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
