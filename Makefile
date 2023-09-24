DB = mariadb
WP = wordpress
NGINX = nginx

FTP = vsftpd
REDIS = redis
GRAF = grafana
ST = static-page
ADMINER = adminer

VOLUME = /home/hakahmed/data/db \
					/home/hakahmed/data/wordpress \
					/home/hakahmed/data/adminer


run: $(VOLUME)
	docker compose -f ./srcs/docker-compose.yml up --build --remove-orphans

dt: $(VOLUME)
	docker compose -f ./srcs/docker-compose.yml up --build -d --remove-orphans

down:
	docker compose -f ./srcs/docker-compose.yml down 

re:
	sudo rm -rf /home/hakahmed/data 
	make 

$(VOLUME):
	mkdir -p $(VOLUME) 2>/dev/null

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
$(ADMINER):
	docker compose -f ./srcs/docker-compose.yml exec $(ADMINER) sh
