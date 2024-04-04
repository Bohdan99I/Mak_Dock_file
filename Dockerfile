
FROM quay.io/projectquay/golang:1.20


WORKDIR /app


COPY go.mod go.sum ./


RUN go mod download


COPY . .


RUN go build -o ./bin/$(IMAGE_NAME)


CMD ["./bin/$(IMAGE_NAME)"]
