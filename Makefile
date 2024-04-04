linux:
    GOOS=linux GOARCH=amd64 go build -o myapp-linux-amd64 .

arm:
    GOOS=linux GOARCH=arm go build -o myapp-linux-arm .

macos:
    GOOS=darwin GOARCH=amd64 go build -o myapp-macos-amd64 .

windows:
    GOOS=windows GOARCH=amd64 go build -o myapp-windows-amd64.exe .

clean:
    docker rmi <IMAGE_TAG>
