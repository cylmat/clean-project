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
./bin/install express-app node
./bin/install react-app node
```

- Add "import AppBackend from './AppBackend'" in react's App.js
- Add <AppBackend /> in react's App.js
- Change .env backend's port in react-app

* Run container's servers
```shell
make express-start
make react-start
```

### Symfony + React

* Uncomment docker compose in compose.override.yml.local
```
include:
    - .docker/compose/node.yml
    - .docker/compose/php.yml
    - .docker/compose/db/mysql.yml
```

* Up docker containers

- Change DocumentRoot in .docker/config/apache2/000-default.conf.local
```shell
make up
```

* Run install script to help creating project
```shell
export UID=$(id -u)
export GID=$(id -g)
./bin/install symfony-app php
./bin/install react-app node
```

- Change .env backend's port in react-app

* Run container's servers
```shell
make symfony-start
make react-start
```

## Databases

### Mysql

PhpMyAdmin
- Url: http://localhost:8083
- Server: mysql
- User/pass: root/root or user/pass

```shell
mysql -u user -ppass -h localhost mydb
```

## Recipes

### Use fixtures demo backend api

```
export BACKEND_API_PORT=80

# Get users 
curl -X GET http://localhost:$BACKEND_API_PORT/api/user

# Create user
curl -X POST http://localhost:$BACKEND_API_PORT/api/user -d '{"name":"John Doe","email":"jdoe@me.com","password":"password"}'
```

### Custom recipe

- Just rename .recipes/custom.local.dist to custom.local, or create new one
- Run it with "./bin/install custom.local"

### Stack recipe

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
- https://symfony.com
