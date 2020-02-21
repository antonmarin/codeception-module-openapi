.DEFAULT_GOAL=help

help:
	@printf "\
		lint\t prebuild validations \n\
		test\t test library \n\
	"

lint:
	docker run --rm -iv $PWD:/data/ cytopia/php-cs-fixer fix --dry-run --diff

test:
	vendor/bin/phpstan analyse .
	vendor/bin/codecept run
