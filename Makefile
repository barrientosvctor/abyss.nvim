STYLUA_PKG = stylua
BASE_STYLUA_FLAGS = --config-path .stylua.toml --no-editorconfig --glob "**/*.lua"

check:
	$(STYLUA_PKG) $(BASE_STYLUA_FLAGS) --check .

fmt:
	$(STYLUA_PKG) $(BASE_STYLUA_FLAGS) .

lint:
	luacheck lua
