#########
# Usage #
#########

.PHONY: down help restart up

# APP
EXPRESS_APP ?= express-app
MERN_APP ?= mern-app

# CONTAINER
NODE_CONTAINER ?= node

##########
# DOCKER #
##########

up:
	docker compose --env-file .env --env-file .env.local up --build -d

down:
	docker compose down --remove-orphans

restart:
	${MAKE} down && ${MAKE} up

#######
# RUN #
#######

express:
	docker exec $(NODE_CONTAINER) sh -c "cd $(EXPRESS_APP); DEBUG=$(EXPRESS_APP):* npm start"

mern-back:
	docker exec $(NODE_CONTAINER) sh -c "cd $(MERN_APP)/backend; npm run dev"

mern-front:
	docker exec $(NODE_CONTAINER) sh -c "cd $(MERN_APP)/frontend; npm start"
