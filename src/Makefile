contaieners = wordpress nginx mariadb redis ftp adminer static_webpage minio

all:
	docker-compose up --build $(contaieners)

re: fclean
	docker-compose up --build $(contaieners)

redis:
	docker-compose up --build redis

clean:
	docker rm $(contaieners)

vclean: clean
	docker volume rm src_wordpress_vol src_mysqldata src_cache src_bonus_vol src_minio_vol

iclean:
	docker rmi -f src_wordpress
	docker rmi -f src_nginx
	docker rmi -f src_mariadb
	docker rmi -f src_redis
	docker rmi -f src_ftp
	docker rmi -f src_adminer
	docker rmi -f src_static_webpage
	docker rmi -f src_minio

fclean: clean iclean vclean

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
