local api = require("abyss.lib.api")
local M = {
  default_options = {
    italic_comments = true,
    italic = false,
    bold = false,
    transparent_background = false,
    treesitter = not api.is_vim,
    overrides = nil,
  },
}

M.options = M.default_options

---set user options for the colorscheme
---@param opts AbyssOptions
function M.set_options(opts)
  opts = opts or {}
  M.options = api.tbl_deep_extend("keep", opts, M.default_options)
end

return M
