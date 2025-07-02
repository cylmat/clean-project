# Clean installation project

Clean installed directory for a new development project

### Clone project in project dir

```shell
git clone https://github.com/cylmat/clean-project my_project
cd my_project
rm -r .git
```

Then run install script to help creating project:
```shell
docker compose --env-file .env --env-file .env.local up --build -d
docker compose down --remove-orphans
```

For MERN project
```shell
export CONTAINER=main_server
make install recipe=express
# make express
```

### Local Uncommited Overriding

```
RECIPES
- in .recipes/init_main_recipes.local
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
