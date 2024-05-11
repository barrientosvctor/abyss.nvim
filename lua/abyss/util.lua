local M = {}
local theme = require("abyss.theme")
local api = require("abyss.lib.api")
local lib_util = require("abyss.lib.util")

---Performs the necessary processes to correctly load the colorscheme.
---@param user_opts AbyssOptions
function M.load(user_opts)
  api.command("hi clear")

  if vim.fn.exists("syntax_on") then api.command("syntax reset") end

    api.command("set termguicolors")

  vim.g.colors_name = "abyss"

    local groups = theme.get(user_opts)

    for key, value in pairs(groups) do
        api.highlight(key, value)
    end

    if (type(user_opts.overrides) ~= "nil" and type(user_opts.overrides) == "table") then
        if lib_util.table_length(user_opts.overrides) == 0 then return end

        for key, opts in pairs(user_opts.overrides) do
            api.highlight(key, opts)
        end
    end

  theme.load_terminal_colors()
end

return M
