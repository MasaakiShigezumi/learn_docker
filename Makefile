setup:
	@make build
	@make up
	@make compose-update

build:
	docker compose build --no-cache --force-rm
stop:
	docker compose stop
up:
	docker compose up -d
compose-update:
	docker compose exec app bash -c "cd ./src && composer update"
data:
	docker compose exec app bash -c "cd ./src && php artisan migrate"
	docker compose exec app bash -c "cd ./src && php artisan db:seed"

ui-package:
	docker compose exec app bash -c "cd ./src && composer require laravel/ui"

react-auth:
	docker compose exec app bash -c "cd ./src && php artisan ui react --auth"

npm-update:
	docker compose exec app bash -c "cd ./src && npm install -g npm"

react-build:
	docker compose exec app bash -c "cd ./src && npm install && npm run dev"