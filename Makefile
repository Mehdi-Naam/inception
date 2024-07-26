all : up

re : fclean up

fclean : down rm_img rm_v d_data

up : 
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

rm_v : 
	@docker volume rm $(shell docker volume ls -q)

d_data :
	@rm -rf ../data/wp/*
	@rm -rf ../data/db/*

rm_img : 
	@docker system prune -af --volumes   

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps