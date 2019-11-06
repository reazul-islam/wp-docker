#!/usr/bin/env bash

# Stop running containers and remove related directories
read -p "Do you really want to install [DEV] Wordpress-Nginx-Mariadb (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo "INFO: Installation started, please be patient."
        docker-compose up -d
	sleep 5s
	docker exec --user root -it wordpress_dev apt-get update -y
	docker exec --user root -it wordpress_dev apt-get install nano -y
        echo "INFO: Installation completed"
        exit 0;
    ;;
    * )
        echo "INFO: Exiting without installing Wordpress-Nginx-Mariadb"
        exit 0;
    ;;
esac

exit 0;
