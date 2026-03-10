install:
	poetry install --no-root

test:
	poetry run pytest .

docker:
	docker compose run --rm test