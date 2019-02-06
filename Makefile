build:
	docker-compose build --no-cache

down:
	docker-compose down

shell:
	docker-compose exec ruby bash

up:
	docker-compose up