DOCKER_COMPOSE      = docker-compose
DOCKER_COMPOSE_RUN  = $(DOCKER_COMPOSE) run --rm
DOCKER_COMPOSE_EXEC = $(DOCKER_COMPOSE) exec
EXEC_API            = $(DOCKER_COMPOSE_EXEC) php
EXEC_WEBSITE        = $(DOCKER_COMPOSE_EXEC) website
EXEC_CLIENT         = $(DOCKER_COMPOSE_EXEC) client
EXEC_ADMIN          = $(DOCKER_COMPOSE_EXEC) admin
RUN_API             = $(DOCKER_COMPOSE_RUN) php
RUN_WEBSITE         = $(DOCKER_COMPOSE_RUN) website
RUN_CLIENT          = $(DOCKER_COMPOSE_RUN) client
RUN_ADMIN           = $(DOCKER_COMPOSE_RUN) admin

init: ## Launch the init script to init all the project dependencies from their remote
	./scripts/init.sh

update-deps: ## Update all the project dependencies (yarn/composer/docker)
	./scripts/update-deps.sh

install-deps: ## Install all the project dependencies (yarn/composer/docker)
	$(RUN_API) composer install
	$(RUN_API) php bin/console fos:elastica:populate
	$(RUN_WEBSITE) yarn install
	$(RUN_CLIENT) yarn install
	$(RUN_ADMIN) yarn install

init-full: init install-deps

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.DEFAULT_GOAL := help

.PHONY: init update-deps install-deps init-full help
