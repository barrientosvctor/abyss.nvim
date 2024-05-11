STYLUA_PKG = stylua
BASE_STYLUA_FLAGS = --config-path .stylua.toml --glob "**/*.lua"

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check: ## Output the diff in files where code style is not applied
	$(STYLUA_PKG) $(BASE_STYLUA_FLAGS) --check .

fmt: ## Format all lua files according to stylua.toml directives
	$(STYLUA_PKG) $(BASE_STYLUA_FLAGS) .

lint: ## Run the lua linter
	luacheck lua
