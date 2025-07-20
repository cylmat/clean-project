#########
# Usage #
#########

.PHONY: clear-volumes down help restart up

# APP
EXPRESS_APP ?= express-app
SYMFONY_APP ?= symfony-app
# -
REACT_APP ?= react-app

# CONTAINER
NODE_CONTAINER ?= node
PHP_CONTAINER ?= php

# DB
MYSQL_CONTAINER ?= mysql

##########
# DOCKER #
##########

up:
	docker compose --env-file .env --env-file .env.local up --build -d

down:
	docker compose down --remove-orphans

restart:
	${MAKE} down && ${MAKE} up

clear-volumes:
	docker volume rm $(shell docker volume ls -qf dangling=true)

############
# FIXTURES #
# Dev only #
# Reload manually
############

mysql-fixtures:
	docker exec $(MYSQL_CONTAINER) sh -c "mysql -u user -ppass mydb < /docker-entrypoint-initdb.d/mysql.sql"

#######
# RUN #
#######

express-start:
	docker exec $(NODE_CONTAINER) sh -c "cd $(EXPRESS_APP); DEBUG=$(EXPRESS_APP):* npm run dev"

express-stop:
	docker exec $(NODE_CONTAINER) sh -c "cd $(EXPRESS_APP); npm run kill" || true

node-kill:
	docker exec $(NODE_CONTAINER) sh -c "pkill -f 'node'" || true

react-start:
	docker exec $(NODE_CONTAINER) sh -c "cd $(REACT_APP); npm start"

react-stop:
	docker exec $(NODE_CONTAINER) sh -c "cd $(REACT_APP); npm run kill" || true

symfony-start:
	docker exec $(PHP_CONTAINER) sh -c "symfony local:server:start --dir=$(SYMFONY_APP) --listen-ip=0.0.0.0 --port=80"

symfony-stop:
	docker exec $(PHP_CONTAINER) sh -c "symfony local:server:stop --dir=$(SYMFONY_APP)"
