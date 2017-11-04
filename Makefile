IMAGE_NAME = tini-centos

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .
	docker tag ${IMAGE_NAME} stpork/${IMAGE_NAME}

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run
