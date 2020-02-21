.DEFAULT_GOAL=help

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
stan:
	vendor/bin/phpstan analyse .
codeception:
	vendor/bin/codecept run
