CONTAINERS := mariadb wordpress nginx vsftpd redis grafana static-page adminer

YML_PATH = ./srcs/docker-compose.yml

VOL_DIR := /home/hakahmed/data

VOLUMES := db wordpress adminer

VOLUME = $(addprefix $(VOL_DIR)/,$(VOLUMES))

run: $(VOLUME)
	docker compose -f $(YML_PATH) up --build --remove-orphans

dt: $(VOLUME)
	docker compose -f $(YML_PATH) up --build -d --remove-orphans

down:
	docker compose -f $(YML_PATH) down 

re:
	sudo rm -rf $(VOL_DIR)
	make 

$(VOLUME):
	mkdir -p $(VOLUME) 2>/dev/null

exec-%:
	docker compose -f $(YML_PATH) exec $* sh

$(foreach CONTAINER,$(CONTAINERS),$(eval $(CONTAINER): exec-$(CONTAINER)))
