FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cache \
    vsftpd

#RUN apk add vsftpd default

#RUN vsftpd restart
COPY ./conf.sh /etc/conf.sh
RUN chmod 777 /etc/conf.sh
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

ENTRYPOINT [ "sh", "/etc/conf.sh"]

#CMD [ "" ]