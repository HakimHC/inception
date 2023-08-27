DB = db
WP = wp
N = nginx

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
