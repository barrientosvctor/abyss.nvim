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
    for group, opts in pairs(groups) do
        api.highlight(group, opts)
    end

  if user_opts.treesitter then
    local treesitter_groups = theme.get_treesitter()
    for group, opts in pairs(treesitter_groups) do
      api.highlight(group, opts)
    end
  end

    if type(user_opts.overrides) ~= "nil" and type(user_opts.overrides) == "table" and lib_util.table_length(user_opts.overrides) == 0 then
        for key, opts in pairs(user_opts.overrides) do
            api.highlight(key, opts)
        end
    end

  theme.load_terminal_colors()
end

return M
