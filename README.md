# Clean installation project

Clean installed directory for a new development project

### Clone and install project

```shell
git clone https://github.com/cylmat/clean-project my_project
cd my_project
rm .git -rf
```

**E.g. for MERN (Mongo, Express, React, Node.js) project:**

* Uncomment docker compose in compose.override.yml.local
```
include:
    - .docker/compose-services/node.yml
    - .docker/compose-services/mongo.yml
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

* Run install script to help creating project
```shell
export UID=$(id -u)
export GID=$(id -g)
./bin/install express
```

* Run container's server for node
```shell
make express
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
