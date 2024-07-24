.PHONY:	default image publish

REPO=293385631482.dkr.ecr.eu-west-1.amazonaws.com
STORE=epimorphics
IMAGE=sensu-alertmanager
TAG?= $(shell git describe --tags `git rev-list --tags --max-count=1`)
NAME?=${STORE}/${IMAGE}

default: image
all: publish

image:
	@docker build --tag ${NAME}:${TAG} .
	
publish: image
	@docker tag ${NAME}:${TAG} ${REPO}/${NAME}:${TAG}
	@docker push ${REPO}/${NAME}:${TAG}

tag:
	@echo ${TAG}

vars:
	@echo TAG:${TAG}
	@echo NAME:${NAME}
	@echo IMAGE:${IMAGE}
