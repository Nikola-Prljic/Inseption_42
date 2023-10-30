all:
	docker-compose up --build mariadb nginx wordpress redis ftp adminer static_webpage

re: fclean
	docker-compose up --build mariadb nginx wordpress redis ftp adminer static_webpage

redis:
	docker-compose up --build redis

clean:
	docker rm wordpress
	docker rm nginx
	docker rm mariadb
	docker rm redis
	docker rm ftp
	docker rm adminer
	docker rm static_webpage

vclean: clean
	docker volume rm src_wordpress_vol src_mysqldata src_cache

iclean:
	docker rmi -f src_wordpress
	docker rmi -f src_nginx
	docker rmi -f src_mariadb
	docker rmi -f src_redis
	docker rmi -f src_ftp
	docker rmi -f adminer
	docker rmi -f static_webpage

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
