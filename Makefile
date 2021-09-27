.PHONY:	default image publish

REPO = 293385631482.dkr.ecr.eu-west-1.amazonaws.com
STORE = epimorphics
IMAGE = sensu-alertmanager
TAG?= $(shell if git describe > /dev/null 2>&1 ; then   git describe; else   git rev-parse --short HEAD; fi)

default: image
all: publish

image:
	@docker build --tag ${REPO}/${STORE}/${IMAGE}:${TAG} .

publish: image
	@docker push ${REPO}/${STORE}/${IMAGE}:${TAG}
