up:
	docker-compose up -d
down:
	docker-compose down
build:
	docker-compose build
restart: down build up
	echo "success"
cli:
	docker-compose exec php-fpm /bin/bash
node:
	docker-compose exec node /bin/bash
phpunit:
	docker-compose run --rm php-fpm vendor/bin/phpunit
