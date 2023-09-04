DB = mariadb
WP = wordpress
NGINX = nginx

run:
	docker compose -f ./srcs/docker-compose.yml up --build

dt:
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

$(DB):
	docker compose -f ./srcs/docker-compose.yml exec $(DB) sh

$(WP):
	docker compose -f ./srcs/docker-compose.yml exec $(WP) sh

$(NGINX):
	docker compose -f ./srcs/docker-compose.yml exec $(NGINX) sh
