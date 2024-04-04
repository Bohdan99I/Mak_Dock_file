# Задання змінних
IMAGE_NAME ?= Mak_Dock_file
IMAGE_TAG ?= Bohdan99I

# Ціль "image" для побудови Docker-образу
image:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# Ціль "clean" для видалення тимчасових файлів та образу
clean:
    rm -f ./bin/$(IMAGE_NAME)
    docker rmi $(IMAGE_NAME):$(IMAGE_TAG)
