FROM quay.io/projectquay/golang:1.20

WORKDIR /go/src/app
COPY . .
RUN make build 

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/Mak_Dock_file .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENTRYPOINT ["./kbot"]