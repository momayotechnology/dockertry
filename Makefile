build:
	docker-compose build --no-cache	--force-rm

stop:
	docker-compose stop

up:
	docker-compose up -d 

composer-update:
	docker exec laravel-docker bash -c "composer update"

if-no-env:
	docker exec laravel-docker bash -c "cp .env.example .env"

data:
	docker exec laravel-docker bash -c "php artisan migrate"
	docker exec laravel-docker bash -c "php artisan db:seed"