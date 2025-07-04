#########
# Usage #
#########

.PHONY: down install help list restart up

RECIPE=$(recipe)
ARGS=$(args)

RECIPE_PATH=$(shell find .recipes -type f -name $(RECIPE))
BASEPATH=$(shell echo "$(RECIPE_PATH)" | rev | cut -d/ -f2- | rev)

help:
	@echo "Usage:"
	@echo ""
	@echo "make up, make down, make reload"
	@echo "export CONTAINER=container_name"
	@echo "export UID=$$(id -u)"
	@echo "export GID=$$(id -g)"
	@echo "make install recipe=recipe_name args=recipe_args"


##########
# DOCKER #
##########

up:
	docker compose --env-file .env --env-file .env.local up --build -d

down:
	docker compose down --remove-orphans

restart:
	${MAKE} down && ${MAKE} up


###########
# RECIPES #
###########

# install recipe
install:
#${MAKE} user
	@docker exec $(CONTAINER) sh -c "mkdir -p /tmp/$(BASEPATH)"
	@docker cp $(RECIPE_PATH) $(CONTAINER):/tmp/$(BASEPATH)/$(RECIPE)
	@docker exec $(CONTAINER) sh -c "/tmp/$(BASEPATH)/$(RECIPE) $(ARGS)"

# add current user
# export UID=$(id -u)
# export GID=$(id -g)
user:
	docker exec -u root $(CONTAINER) sh -c "echo 'root:root' | chpasswd"
	docker exec -u root $(CONTAINER) sh -c "echo 'root' | addgroup user --gid ${GID}"
	docker exec -u root $(CONTAINER) sh -c "adduser user --uid ${UID} --gid ${GID} --gecos GECOS --disabled-password"

list:
	@find .recipes -type f


#######
# RUN #
#######

express:
	docker exec $(CONTAINER) sh -c "cd express-app; DEBUG=express-app:* npm start"