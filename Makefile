install:
	poetry install --no-root

test:
	poetry run pytest .

docker:
	docker compose build test && docker compose run --rm test