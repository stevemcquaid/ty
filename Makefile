run: build ## Run the website locally
	@docker run -d -p 8080:80 --rm --name tywebsite -v "${PWD}":/var/www/ stevemcquaid/ty
	@open http://localhost:8080

stop: ## stop the docker container
	@docker stop tywebsite

build: ## build the docker container
	@docker build -t stevemcquaid/ty:latest .

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
