local M = {}
local api = require("abyss.lib.api")
local config = require("abyss.config")
local util = require("abyss.util")

-- Loads the palette.
function M.load()
  if api.is_nvim then
    if vim.version().minor < 8 then
      vim.notify(
        "Neovim +0.8 is required to use abyss.nvim colorscheme.",
        vim.log.levels.ERROR,
        { title = "Abyss.nvim" }
      )
      return
    end
  end

  util.load()
end

-- Setup the configuration for the colorscheme.
---@param opts AbyssOptions: The custom colorscheme user options
function M.setup(opts) config.set_options(opts) end

return M
