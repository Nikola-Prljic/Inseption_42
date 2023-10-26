all:
	docker-compose up --build mariadb nginx wordpress redis

re: fclean
	docker-compose up --build mariadb nginx wordpress redis

redis:
	docker-compose up --build redis

clean:
	docker rm wordpress
	docker rm nginx
	docker rm mariadb

vclean: clean
	docker volume rm src_wordpress_vol src_mysqldata

iclean:
	docker rmi -f src_wordpress
	docker rmi -f src_nginx
	docker rmi -f src_mariadb

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
