
TEMP_DIR ?= /tmp

build:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) \
        --build-arg IMAGE_NAME=$(IMAGE_NAME) \
        --build-arg IMAGE_TAG=$(IMAGE_TAG) \
        --build-arg TEMP_DIR=$(TEMP_DIR) .
