WEB_DB_NAME = odoo_development
DOCKER = docker
DOCKER_COMPOSE = $(DOCKER) compose
CONTAINER_ODOO = odoo
CONTAINER_DB = odoo-postgres

help:
	@echo "Available commands: make {options}"
	@echo "  start			Start the compose with daemon"
	@echo "  stop			Stop the compose"
	@echo "  restart		Restart the compose"
	@echo "  console		Odoo interactive console"
	@echo "  psql			Postgres interactive shell"
	@echo "  logs odoo		Logs the odoo container"
	@echo "  logs db		Logs the postgresql container"

start:
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) stop

restart:
	$(DOCKER_COMPOSE) restart	

console:
	$(DOCKER) exec -it $(CONTAINER_ODOO) odoo shell --db_host=$(CONTAINER_DB) -d $(WEB_DB_NAME) -r $(CONTAINER_ODOO) -w $(CONTAINER_ODOO)

psql:
	$(DOCKER) exec -it $(CONTAINER_DB) psql -U $(CONTAINER_ODOO) -d $(WEB_DB_NAME)

define log_target
	@if [ "$(1)" = "odoo" ]; then \
		$(DOCKER_COMPOSE) logs -f ${CONTAINER_ODOO}; \
	elif [ "$(1)" = "db" ]; then \
		$(DOCKER_COMPOSE) logs -f ${CONTAINER_DB}; \
	else \
		echo "Invalid logs target. pakai 'odoo' atau 'db'"; \
	fi
endef

logs:
	$(call log_target, $(word 2, $(MAKECMDGOALS)))

.PHONY: start stop restart console psql logs odoo db