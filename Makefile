#########
# Usage #
#########

.PHONY: down install help list restart up

RECIPE=$(recipe)
ARGS=$(args)

RECIPE_PATH=$(shell find .recipes -type f -name $(RECIPE))
BASEPATH=$(shell echo "$(RECIPE_PATH)" | rev | cut -d/ -f2- | rev)

help:
	@echo "Usage: make install container=container_name recipe=recipe_name args=recipe_args"

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
	echo $(CONTAINER)
#	docker exec $(CONTAINER) sh -c "DEBUG=express-project:* npm start"

###########
# RECIPES #
###########

install:
	@docker exec $(CONTAINER) sh -c "mkdir -p /tmp/$(BASEPATH)"
	@docker cp $(RECIPE_PATH) $(CONTAINER):/tmp/$(BASEPATH)/$(RECIPE)
	@docker exec $(CONTAINER) sh -c "/tmp/$(BASEPATH)/$(RECIPE) $(ARGS)"

list:
	@find .recipes -type f