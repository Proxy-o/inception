
all:
	mkdir -p /home/otait-ta/data/mariadb && mkdir -p /home/otait-ta/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	
	docker-compose -f ./srcs/docker-compose.yml build

down:
	
	docker-compose -f ./srcs/docker-compose.yml down

re:	down
	
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	
	docker system prune -a

fclean:
	sudo rm -rf /home/otait-ta/data/mariadb  && sudo rm -rf /home/otait-ta/data/wordpress
	mkdir -p /home/otait-ta/data/mariadb && mkdir -p /home/otait-ta/data/wordpress
	docker stop $$(docker ps -qa) 2>/dev/null || true
	docker rm $$(docker ps -qa) 2>/dev/null || true
	docker rmi -f $$(docker images -qa) 2>/dev/null || true
	docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	docker network rm $$(docker network ls -q) 2>/dev/null || true

.PHONY	: all build down re clean fclean
