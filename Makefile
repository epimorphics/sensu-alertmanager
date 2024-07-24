.PHONY:	default image publish

REPO=293385631482.dkr.ecr.eu-west-1.amazonaws.com
STORE=epimorphics
IMAGE=sensu-alertmanager
VERSION?= $(shell git describe --tags)
NAME?=${STORE}/${IMAGE}
COMMIT=$(shell git rev-parse --short HEAD)
TAG?=$(shell printf '%s_%s_%08d' ${VERSION} ${COMMIT} ${GITHUB_RUN_NUMBER})

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
	@echo VERSION:${VERSION}
	@echo COMMIT:${COMMIT}
	@echo IMAGE:${IMAGE}
