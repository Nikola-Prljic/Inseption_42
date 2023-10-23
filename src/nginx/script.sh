#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /cert/nginx-selfsigned.pem -subj "/C=AT/L=VIENNA/O=1337/OU=student/CN=nprljic.42.at"
