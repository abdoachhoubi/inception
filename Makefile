DC= docker-compose
DC_PATH= ./srcs/docker-compose.yml
WP_V= ~/Desktop/inception/data/mariadb_data
DB_V= ~/Desktop/inception/data/wordpress_data
V= ~/Desktop/inception/data

all:
	mkdir -p ${WP_V}
	mkdir -p ${DB_V}
	${DC} -f ${DC_PATH} up --build

down:
	${DC} -f ${DC_PATH} down

up:
	${DC} -f ${DC_PATH} up

restart:
	${DC} -f ${DC_PATH} restart

prune:
	${DC} -f ${DC_PATH} down --rmi all --volumes

clean:
	sudo rm -rf ${WP_V}
	sudo rm -rf ${DB_V}
	sudo rm -rf ${V}

fclean: prune clean

re: fclean all
