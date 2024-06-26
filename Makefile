APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := bohdan99I
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux 
TARGETARCH=arm64 

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o Mak_Dock_file -ldflags "-X="github.com/Bohdan99I/Mak_Dock_file/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH} 

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf Mak_Dock_file
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}