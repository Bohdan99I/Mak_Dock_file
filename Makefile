
IMAGE_NAME ?= Mak_Dock_file
IMAGE_TAG ?= Bohdan99I


image:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .


clean:
    rm -f ./bin/$(IMAGE_NAME)
    docker rmi $(IMAGE_NAME):$(IMAGE_TAG)
