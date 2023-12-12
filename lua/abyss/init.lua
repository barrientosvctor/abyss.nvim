local M = {}
local util = require("abyss.util")

-- Load the theme
function M.setup()
	if vim.version().minor < 8 then
		vim.notify("Neovim +0.8 is required to use abyss.nvim colorscheme.", vim.log.levels.ERROR,
			{ title = "Abyss.nvim" })
		return
	end

	util.load()
end

return M
