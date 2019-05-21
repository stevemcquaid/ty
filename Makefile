run: ## Run the website locally
	@export JEKYLL_VERSION=3.8
	@docker run --rm \
 	-v ${PWD}:/srv/jekyll \
	-d -p 1234:1234 jekyll/jekyll:${JEKYLL_VERSION} \
	jekyll build
	@open http://localhost:1234

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
