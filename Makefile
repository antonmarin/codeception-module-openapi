.DEFAULT_GOAL=help
PHP_VERSION=7.0
DEV_IMAGE_NAME="antonmarin/codeception-openapi:dev"
CMD_DOCKER_RUN=docker run -itv $(PWD):/app -w /app $(DEV_IMAGE_NAME)

help:
	@printf "\
		lint\t prebuild validations \n\
		test\t test library \n\
	"

lint: lint-cs lint-composer
lint-composer:
	docker run --rm -iv $(PWD):/app/ composer:1.9 validate
lint-cs:
	docker run --rm -iv $PWD:/data/ cytopia/php-cs-fixer fix --dry-run --diff

test: stan codeception
rebuild:
	docker build --build-arg PHP_VERSION=$(PHP_VERSION) -t $(DEV_IMAGE_NAME) -f docker/Dockerfile .
	$(CMD_DOCKER_RUN) rm -f composer.lock
	$(CMD_DOCKER_RUN) composer install
stan:
	$(CMD_DOCKER_RUN) vendor/bin/phpstan analyse . -vvv
codeception:
	$(CMD_DOCKER_RUN) vendor/bin/codecept run
