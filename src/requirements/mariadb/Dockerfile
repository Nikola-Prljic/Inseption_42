FROM alpine:3.18

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY setup_db.sh /tmp/setup_db.sh

ENTRYPOINT ["sh", "/tmp/setup_db.sh"]