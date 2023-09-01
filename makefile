all:
	docker-compose -f srcs/docker-compose.yaml build
	 

build: all

up: 
	docker-compose -f srcs/docker-compose.yaml up -d

down: 
	docker-compose -f srcs/docker-compose.yaml down

start: 
	docker-compose -f srcs/docker-compose.yaml start

stop: 
	docker-compose -f srcs/docker-compose.yaml stop

restart: 
	docker-compose -f srcs/docker-compose.yaml restart