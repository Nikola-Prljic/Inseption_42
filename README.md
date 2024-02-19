# Inception

Inception is a system administration project aimed at enhancing knowledge of system administration through the use of Docker. 
The project involves virtualizing several Docker images within a personal virtual machine.

## Mandatory Part

* Setting up a small infrastructure of different services using Docker Compose. 
* Each Docker image must have a corresponding service, run in a dedicated container, and be built from Alpine or Debian. 
* NGINX, WordPress with php-fpm, and MariaDB containers must be set up, along with volumes for the WordPress database and website files. 
* Additionally, a docker-network must establish connections between containers, and containers must restart in case of a crash.

## Bonus Part

* Redis cache for the WordPress website
* FTP server container
* static website in a language other than PHP
* Adminer
* service of choice (my chice minio)
