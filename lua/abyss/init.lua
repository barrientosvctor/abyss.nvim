local M = {}
local api = require("abyss.lib.api")
local config = require("abyss.config")
local util = require("abyss.util")

-- Load the theme
--opts: The custom colorscheme user options
---@param opts AbyssOptions
function M.setup(opts)
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

  config.set_options(opts)
  util.load(config.options)
end

return M
