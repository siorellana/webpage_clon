name="webpage"
BUILDID=$(shell date +%Y%m%d-%H:%M:%S)

.PHONY: all run test stop help commit push registry

all: help

build: ## Compila el codigo y lo sube a Firebase
	@git add . || \
	echo "[ERROR] Cambios no agregados"
	@hugo || \
	echo "[ERROR] HUGO no ejecutado"
	@firebase deploy || \
	echo "[ERROR] Cambios no enviados a Firebase"
	@docker build -t siorellana/$(name) . || \
	echo "[ERROR] Imagen no creada"

deploy: test build commit push

run: ## Ejecuta contenedor con puerto 81
	@echo "[INFO] Starting container"
	@docker run -d --name $(name) -p 81:80 siorellana/$(name) || \
	echo "[ERROR] Container already started"
	@echo "[END] Inicio completado"

test: ## Saluda a lo millenial
	@echo $(BUILDID)

verify: httpd/indedx.php
	@echo "[Info] PHP file exists"

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

commit: ## Realiza commit con variable de whatthecommit
	@git commit -m 'Se han realizado nuevos cambios - su build id es: $(BUILDID)'

push: ## Realiza push a master
	@git push origin master

registry: ## Envía imagen a docker hub
	@docker push siorellana/webpage:latest

init:
	@