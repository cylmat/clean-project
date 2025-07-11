#########
# Usage #
#########

.PHONY: clear-volumes down help restart up

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

clear-volumes:
	docker volume rm $(shell docker volume ls -qf dangling=true)

#######
# RUN #
#######

express:
	docker exec $(NODE_CONTAINER) sh -c "cd $(EXPRESS_APP); DEBUG=$(EXPRESS_APP):* npm start"

sym-react:
	echo "todo"

mern-back:
	docker exec $(NODE_CONTAINER) sh -c "cd $(MERN_APP)/backend; npm run dev"

mern-front:
	docker exec $(NODE_CONTAINER) sh -c "cd $(MERN_APP)/frontend; npm start"

mern-fixtures:
	curl -X POST http://localhost:3000/api/user \
		-H "Content-Type: application/json" \
		-d '{"name":"John Doe2","email":"jdoe@me.com","password":"password"}'