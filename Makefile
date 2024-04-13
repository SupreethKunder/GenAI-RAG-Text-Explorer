IMAGE_NAME := $(DOCKER_USERNAME)/$(CLIENT_NAME)-$(CNAME)

all: docker-deploy

.PHONY: requirements
requirements:
	@echo "$(RELEASE_TYPE)"
	@poetry install


.PHONY: do-build
do-build: requirements
	@poetry build


.PHONY: docker-deploy
docker-deploy: do-build
	@export DOCKER_BUILDKIT=1
	@docker buildx create --use
	@docker buildx build . --push -t $(IMAGE_NAME):$(VERSION)-$(DEPLOYMENT_TYPE)
