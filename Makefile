#########
# Usage #
#########

.PHONY: clear-volumes down help restart up

# APP
EXPRESS_APP ?= express-app
MERN_APP ?= mern-app
SYMFONY_APP ?= symfony-app

# CONTAINER
NODE_CONTAINER ?= node
PHP_CONTAINER ?= php

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

#######
# RUN #
#######

express:
	docker exec $(NODE_CONTAINER) sh -c "cd $(EXPRESS_APP); DEBUG=$(EXPRESS_APP):* npm start"

mern-back:
	docker exec $(NODE_CONTAINER) sh -c "cd $(MERN_APP)/backend; npm run dev"

mern-front:
	docker exec $(NODE_CONTAINER) sh -c "cd $(MERN_APP)/frontend; npm start"

mern-fixtures:
	curl -X POST http://localhost:3000/api/user \
		-H "Content-Type: application/json" \
		-d '{"name":"John Doe2","email":"jdoe@me.com","password":"password"}'

symfony-start:
	docker exec $(PHP_CONTAINER) sh -c "symfony local:server:start --dir=$(SYMFONY_APP) --listen-ip=0.0.0.0 --port=80 -d"

symfony-stop:
	docker exec $(PHP_CONTAINER) sh -c "symfony local:server:stop --dir=$(SYMFONY_APP)"