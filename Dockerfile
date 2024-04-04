# Використання базового образу quay.io/projectquay/golang:1.20
FROM quay.io/projectquay/golang:1.20

# Робочий каталог /app
WORKDIR /app

# Копіювання файлів go.mod та go.sum
COPY go.mod go.sum ./

# Завантаження модулів Go
RUN go mod download

# Копіювання усіх файлів
COPY . .

# Збірка бінарного файлу
RUN go build -o ./bin/$(IMAGE_NAME)

# Встановлення команди за умовчанням
CMD ["./bin/$(IMAGE_NAME)"]
