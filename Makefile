# Задання змінних
IMAGE_NAME ?= my_image
IMAGE_TAG ?= latest

# Ціль "linux" для збірки коду для Linux
linux:
    GOOS=linux GOARCH=amd64 go build -o ./bin/linux/$(IMAGE_NAME)

# Ціль "arm" для збірки коду для arm
arm:
    GOOS=linux GOARCH=arm64 go build -o ./bin/arm/$(IMAGE_NAME)

# Ціль "macos" для збірки коду для macOS
macos:
    GOOS=darwin GOARCH=amd64 go build -o ./bin/macos/$(IMAGE_NAME)

# Ціль "windows" для збірки коду для Windows
windows:
    GOOS=windows GOARCH=amd64 go build -o ./bin/windows/$(IMAGE_NAME)

# Ціль "clean" для видалення новоствореного образу
clean:
    docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Ціль "image" для збірки Docker-образу
image:
    docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
