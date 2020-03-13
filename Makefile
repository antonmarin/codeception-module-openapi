.DEFAULT_GOAL=help
PHP_VERSION=7.1
DEV_IMAGE_NAME="antonmarin/codeception-openapi:dev"
CMD_DOCKER_RUN=docker run -iv $(PWD):/app -w /app $(DEV_IMAGE_NAME)

help:
	@printf "\
		exec\t connect to shell of current dev image \n\
		lint\t prebuild validations \n\
		test\t test library \n\
	"

exec:
	docker run -itv $(PWD):/app -w /app $(DEV_IMAGE_NAME) sh

fix-cs:
	docker run --rm -iv $(PWD):/data/ cytopia/php-cs-fixer fix --diff --allow-risky=yes

lint: lint-cs lint-composer lint-mnd
lint-composer:
	docker run --rm -iv $(PWD):/app/ composer:1.9 validate
lint-cs:
	docker run --rm -iv $(PWD):/data/ cytopia/php-cs-fixer fix --diff --allow-risky=yes --dry-run
lint-mnd:
	docker run --rm -v $(PWD):/app dockerizedphp/phpmnd /app \
        --exclude=var --exclude=vendor --exclude=src/Pcs/Resources/blockslib/blocks \
        --non-zero-exit-on-violation

test: stan codeception
rebuild:
	docker build --build-arg PHP_VERSION=$(PHP_VERSION) -t $(DEV_IMAGE_NAME) -f docker/Dockerfile .
	$(CMD_DOCKER_RUN) rm -f composer.lock
	$(CMD_DOCKER_RUN) composer install
	$(CMD_DOCKER_RUN) vendor/bin/codecept build
stan:
	$(CMD_DOCKER_RUN) vendor/bin/phpstan analyse . -vvv --no-progress
codeception:
	$(CMD_DOCKER_RUN) vendor/bin/codecept run
