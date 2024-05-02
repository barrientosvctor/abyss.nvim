local util = {}
local theme = require("abyss.theme")

---Performs the necessary processes to correctly load the colorscheme.
---@param user_opts AbyssOptions
function util.load(user_opts)
  vim.api.nvim_command("hi clear")

  if vim.fn.exists("syntax_on") then vim.api.nvim_command("syntax reset") end

  vim.o.termguicolors = true
  vim.g.colors_name = "abyss"

  theme.load_colorscheme(user_opts)
  theme.load_terminal()

  if type(user_opts.overrides) == "table" then
    for key, opts in pairs(user_opts.overrides) do
      vim.api.nvim_set_hl(0, key, opts)
    end
  elseif type(user_opts.overrides) == "function" then
    user_opts.overrides()
  end
end

return util
