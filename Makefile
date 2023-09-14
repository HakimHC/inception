DB = mariadb
WP = wordpress
NGINX = nginx
FTP = vsftpd
REDIS = redis
GRAF = grafana
ST = static-page

run:
	docker compose -f ./srcs/docker-compose.yml up --build --remove-orphans

dt:
	docker compose -f ./srcs/docker-compose.yml up --build -d --remove-orphans

down:
	docker compose -f ./srcs/docker-compose.yml down 

re:
	sudo rm -rf /home/hakahmed/data 
	make 

$(DB):
	docker compose -f ./srcs/docker-compose.yml exec $(DB) sh

$(WP):
	docker compose -f ./srcs/docker-compose.yml exec $(WP) sh

$(NGINX):
	docker compose -f ./srcs/docker-compose.yml exec $(NGINX) sh

$(FTP):
	docker compose -f ./srcs/docker-compose.yml exec $(FTP) sh

$(REDIS):
	docker compose -f ./srcs/docker-compose.yml exec $(REDIS) sh
$(GRAF):
	docker compose -f ./srcs/docker-compose.yml exec $(GRAF) sh
$(ST):
	docker compose -f ./srcs/docker-compose.yml exec $(ST) sh
