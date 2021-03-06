check-network:
	(docker network ls | awk '{ print $2 }' | grep -q zolletta_default) || docker network create --subnet "172.25.0.1/24" -d bridge zolletta_default

start:
	docker-compose start

stop:
	docker-compose stop

shell:
	docker exec -it zolletta-slack-url-keeper-php /bin/bash

mysql:
	docker exec -it zolletta-slack-url-keeper-mysql mysql -uroot -p

recreate:
	docker-compose up --force-recreate --no-start

composer-install:
	docker-compose run composer install

composer-update:
	docker-compose run composer update

composer-dump-autoload:
	docker-compose run composer dump-autoload