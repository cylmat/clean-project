# Clean installation project
Clean installed directory for a new development project

Clone project in project dir
```
mkdir my_project && cd my_project
git clone https://github.com/cylmat/clean-project .
rm -r .git
```

Then run install script to help creating project:
```
...
```

LOCAL UNCOMMITED OVERRIDING
```
RECIPES
- in .recipes/init_main_recipes.local

SERVICES
- in compose.override.yml.local
```