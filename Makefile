build:
	docker-compose build --no-cache	--force-rm

stop:
	docker-compose stop

up:
	docker-compose up -d 

composer-update:
	docker exec laravel-docker bash -c "composer update"
	docker exec laravel-docker bash -c "chmod o+w ./storage/ -R"
	docker exec laravel-docker bash -c "chown www-data:www-data -R ./storage"

generate-app-key:
	docker exec laravel-docker bash -c "php artisan key:generate"
	docker exec laravel-docker bash -c "php artisan cache:clear"
	

if-no-env:
	docker exec laravel-docker bash -c "cp .env.example .env"



data:
	docker exec laravel-docker bash -c "php artisan migrate"
	docker exec laravel-docker bash -c "php artisan db:seed"