#########
# Usage #
#########

.PHONY: down help restart up

# APP
EXPRESS_APP ?= express-app

# CONTAINER
NODE_CONTAINER ?= node

##########
# DOCKER #
##########

up:
	@if [ -z "$(UID)" ]; then echo "export UID=\$$(id -u)"; fi;
	@if [ -z "$(GID)" ]; then echo "export GID=\$$(id -g)"; fi;
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