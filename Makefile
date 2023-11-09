contaieners = wordpress nginx mariadb ftp adminer static_webpage minio redis
docker_down = docker-compose -f ./srcs/docker-compose.yaml down
docker_up = docker-compose -f ./srcs/docker-compose.yaml up --build

.PHONY: all re stop clean vcelan fcelan pure folders

all: folders
	$(docker_up) $(contaieners)

re: fclean all

stop:
	docker stop $(contaieners)

clean:
	$(docker_down)

vclean: rmfolders
	$(docker_down) -v

fclean: rmfolders
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

define make_volumes
	@if [ ! -d "$(1)" ]; then \
		mkdir -p "$(1)"; \
		echo "$(1) directory created"; \
	fi
endef

folders:
	$(call make_volumes,/home/${USER}/data/minio_vol)
	$(call make_volumes,/home/${USER}/data/bonus_vol)
	$(call make_volumes,/home/${USER}/data/cache)
	$(call make_volumes,/home/${USER}/data/mysqldata)
	$(call make_volumes,/home/${USER}/data/wordpress_vol)

rmfolders:
	sudo rm -r -f /home/${USER}/data/minio_vol
	sudo rm -r -f /home/${USER}/data/bonus_vol
	sudo rm -r -f /home/${USER}/data/cache
	sudo rm -r -f /home/${USER}/data/mysqldata
	sudo rm -r -f /home/${USER}/data/wordpress_vol

#docker rm $(docker ps --filter status=exited -q)
