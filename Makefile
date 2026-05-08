compose = docker compose -f srcs/docker-compose.yml

all:
# 	mkdir -p /home/samet/data/mariadb
	mkdir -p /home/samet/data/wordpress
	$(compose) up -d --build

mariadb:
# 	mkdir -p /home/samet/data/mariadb
	$(compose) up -d --build mariadb

up:
	$(compose) up -d

build:
	$(compose) build

logs:
	$(compose) logs

stop:
	$(compose) stop

rm:
	$(compose) rm

down:
	$(compose) down

clean:
	$(compose) -v

down-clean:
	$(compose) down -v

ps:
	$(compose) ps



re: clean all

.PHONY: all mariadb up build logs stop rm down clean down-clean ps re