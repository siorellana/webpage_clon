name="webpage"
BUILDID=$(shell date +%Y%m%d-%H:%M:%S)

.PHONY: all run test stop help commit push registry

all: help

deploy: test build commit push registry

build: ## Compila el codigo y lo sube a Firebase
	@hugo || \
	echo "[ERROR] HUGO no ejecutado"
	@git add . || \
	echo "[ERROR] Cambios no agregados"
	@firebase deploy || \
	echo "[ERROR] Cambios no enviados a Firebase"
	@docker build -t siorellana/$(name) . || \
	echo "[ERROR] Imagen no creada"

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
	@git commit -am 'Se han realizado nuevos cambios - su build id es: $(BUILDID)'

push: ## Realiza push a master
	@git push origin master

registry: ## Envía imagen a docker hub
	@docker push siorellana/webpage:latest

clone:
	@sh ./scripts/clone.sh

init:
	@

k8s: ## Comandos de K8S para distintos artefactos
	@kubectl apply -f bin/00-namespace.yaml
	@kubectl -n $(name) apply -f bin/01-service.yaml
	@kubectl -n $(name) apply -f bin/02-rcontroller.yaml
	@kubectl -n $(name) apply -f bin/03-loadbalancer.yaml
	@kubectl -n $(name) apply -f bin/04-deployment.yaml
	@kubectl apply -f bin/metrics
	@kubectl -n $(name) apply -f bin/05-hpa.yaml