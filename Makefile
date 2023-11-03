contaieners = wordpress nginx mariadb ftp adminer static_webpage minio redis
docker_down = docker-compose -f ./src/docker-compose.yaml down
docker_up = docker-compose -f ./src/docker-compose.yaml up --build -d 

all:
	$(docker_up) $(contaieners)

re: fclean
	$(docker_up) $(contaieners)

stop:
	docker stop $(contaieners)

clean:
	$(docker_down)

vclean:
	$(docker_down) -v

fclean:
	$(docker_down) --rmi all -v

pure:
	docker image prune

execw:
	docker exec -it wordpress sh

execn:
	docker exec -it nginx sh

execr:
	docker exec -it redis sh

execm:
	docker exec -it mariadb sh

execf:
	docker exec -it ftp sh

execa:
	docker exec -it adminer sh

folders:
	mkdir -p /home/${USER}/data/minio_vol
	mkdir -p /home/${USER}/data/bonus_vol
	mkdir -p /home/${USER}/data/cache
	mkdir -p /home/${USER}/data/mysqldata
	mkdir -p /home/${USER}/data/wordpress_vol
