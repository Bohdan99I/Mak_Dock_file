
IMAGE_NAME = your-project-name
IMAGE_TAG = latest

linux:
	GOOS=linux GOARCH=amd64 go build -o ./bin/linux/$(IMAGE_NAME)

arm:
	GOOS=linux GOARCH=arm64 go build -o ./bin/arm/$(IMAGE_NAME)


macos:
	GOOS=darwin GOARCH=amd64 go build -o ./bin/macos/$(IMAGE_NAME)


windows:
	GOOS=windows GOARCH=amd64 go build -o ./bin/windows/$(IMAGE_NAME)


clean:
	rm -rf ./bin
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)
