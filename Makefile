DC= docker-compose
DC_PATH= ./srcs/docker-compose.yml
WP_V= ./data/wordpress_data
DB_V= ./data/mariadb_data
V= ./data

all:
	mkdir -p ${WP_V}
	mkdir -p ${DB_V}
	${DC} -f ${DC_PATH} up --build

down:
	${DC} -f ${DC_PATH} down

restart:
	${DC} -f ${DC_PATH} restart

prune:
	${DC} -f ${DC_PATH} --rmi all --volumes

clean:
	rm -rf ${WP_V}
	rm -rf ${DB_V}
	rm -rf ${V}

fclean: prune clean

re: fclean all
