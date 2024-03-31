local util = {}
local abyss = require("abyss.theme")

function util.load()
    vim.api.nvim_command("hi clear")

    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "abyss"

    abyss.loadSyntax()
    abyss.loadEditor()
    abyss.loadTerminal()
    abyss.loadTreeSitter()
    abyss.loadLSP()
    abyss.loadPlugins()
end

return util
