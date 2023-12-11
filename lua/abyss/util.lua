local util = {}
local abyss = require("abyss.theme")

function util.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "abyss"

	abyss.loadSyntax()
	abyss.loadEditor()
end

return util
