local M = {}
local api = require("abyss.lib.api")
local lib_util = require("abyss.lib.util")
local palettes = require("abyss.palettes")
local theme = require("abyss.theme")
local config = require("abyss.config")

---Performs the necessary processes to correctly load the colorscheme.
function M.load()
  api.command("hi clear")
  if vim.fn.exists("syntax_on") then api.command("syntax reset") end
  api.command("set termguicolors")

  vim.g.colors_name = config.options.palette

  local spec = palettes.get_spec_from_palette(config.options.palette)
  local groups = theme.get(config.options, spec)
  for group, opts in pairs(groups) do
    api.highlight(group, opts)
  end

  if config.options.treesitter then
    local treesitter_groups = theme.get_treesitter(spec)
    for group, opts in pairs(treesitter_groups) do
      api.highlight(group, opts)
    end
  end

  if
      type(config.options.overrides) ~= "nil"
      and type(config.options.overrides) == "table"
      and lib_util.table_length(config.options.overrides) > 0
  then
    for key, opts in pairs(config.options.overrides) do
      api.highlight(key, opts)
    end
  end

  theme.load_terminal_colors(spec)
end

return M
