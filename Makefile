
all:
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	
	docker-compose -f ./srcs/docker-compose.yml down

re:	down
	
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	
	docker system prune -a

fclean:
	sudo rm -rf /home/otait-ta/data/mariadb  && sudo rm -rf /home/otait-ta/data/wordpress
	mkdir /home/otait-ta/data/mariadb && mkdir /home/otait-ta/data/wordpress
	docker stop $$(docker ps -qa) || true
	docker system prune --all --force --volumes || true
	docker network prune --force || true
	docker volume prune --force || true


.PHONY	: all build down re clean fclean
