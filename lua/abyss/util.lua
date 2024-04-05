local util = {}
local theme = require("abyss.theme")

---Performs the necessary processes to correctly load the colorscheme.
function util.load()
    vim.api.nvim_command("hi clear")

    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "abyss"

    theme.load_colorscheme()
    theme.load_terminal()
end

return util
