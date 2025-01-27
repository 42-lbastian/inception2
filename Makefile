NAME = wordpress

all:	$(NAME)

$(NAME):
	docker-compose -f ./srcs/docker-compose.yaml up --build -d

clean:
	docker stop nginx
	docker stop wordpress
	docker stop mariadb
	docker system prune -a --volumes
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb

fclean: clean
	sudo rm -rf /home/lbastian/data/mariadb/*
	sudo rm -rf /home/lbastian/data/wordpress/*

check:
	docker container ls -a
	@echo ""
	docker network ls
	@echo ""
	docker volume ls

re: fclean all

.PHONY: all clean fclean re check
