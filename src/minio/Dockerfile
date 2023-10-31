FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
    wget

RUN mkdir -p /data
RUN wget https://dl.min.io/server/minio/release/linux-amd64/minio
RUN chmod +x minio
RUN mv minio /usr/local/bin/
#"--address", ":9001",
CMD ["minio", "server", "--address", ":9003", "--console-address", ":9004", "/data/"]