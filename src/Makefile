ALL:
	docker-compose -f docker-compose.yaml up

clean:
	docker rmi -f wordpress
	docker rmi -f mynginx
	docker rm src_nginx_1
	docker rm src_wordpress_1

clean cache:
	docker system prune -a