DOCKER_COMPOSE    	= docker-compose
DOCKER_COMPOSE_RUN 	= $(DOCKER_COMPOSE) run --rm
DOCKER_COMPOSE_EXEC = $(DOCKER_COMPOSE) exec
EXEC_API          	= $(DOCKER_COMPOSE_EXEC) exec php
EXEC_WEBSITE      	= $(DOCKER_COMPOSE_EXEC) exec website
EXEC_CLIENT       	= $(DOCKER_COMPOSE_EXEC) exec client
EXEC_ADMIN      	= $(DOCKER_COMPOSE_EXEC) exec admin
RUN_API      	  	= $(DOCKER_COMPOSE_RUN) exec php
RUN_WEBSITE   	 	= $(DOCKER_COMPOSE_RUN) exec website
RUN_CLIENT    	 	= $(DOCKER_COMPOSE_RUN) exec client
RUN_ADMIN     	 	= $(DOCKER_COMPOSE_RUN) exec admin

init:
	sh ./scripts/init.sh

update-deps:
	sh ./scripts/update-deps.sh

install-deps:
	$(RUN_API) composer install
	$(RUN_API) php bin/console fos:elastica:populate
	$(RUN_WEBSITE) yarn install
	$(RUN_CLIENT) yarn install
	$(RUN_ADMIN) yarn install

init-full: init install-deps
