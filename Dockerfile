ARG IMAGE_NAME
ARG IMAGE_TAG

FROM quay.io/projectquay/golang:1.20 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o ./bin/${IMAGE_NAME}

FROM scratch

COPY --from=builder /app/bin/${IMAGE_NAME} /app/${IMAGE_NAME}

CMD ["/app/${IMAGE_NAME}"]
