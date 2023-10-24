all:
	docker-compose up --build mariadb nginx wordpress

re: fclean
	docker-compose up --build mariadb nginx wordpress

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
	docker exec -it  wordpress sh
