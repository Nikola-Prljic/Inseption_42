FROM debian-buster

RUN apt get-update
RUN apt install nginx ssl

COPY index.html /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]