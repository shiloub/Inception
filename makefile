
start :
	mkdir -p /home/amontant/data/wordpress
	mkdir -p /home/amontant/data/mariadb
	cd srcs && sudo docker-compose up --build -d

stop :
	cd srcs && sudo docker-compose stop

fclean : stop
	sudo docker system prune -af

