FROM quay.io/projectquay/golang:1.20

COPY . /app
WORKDIR /app
RUN go build -o myapp .

ENTRYPOINT ["/app/myapp"]
