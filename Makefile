IMAGE_NAME ?= Mak_Dock_file
IMAGE_TAG ?= Bohdan99I

build:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) \
        --build-arg IMAGE_NAME=$(IMAGE_NAME) \
        --build-arg IMAGE_TAG=$(IMAGE_TAG) .

clean:
    rm -rf ./bin
    docker rmi $(IMAGE_NAME):$(IMAGE_TAG)
