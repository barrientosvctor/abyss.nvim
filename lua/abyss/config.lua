local M = {
  default_options = {
    italic_comments = true,
    italic = false,
    bold = false,
    transparent_background = false,
    overrides = nil,
  },
}

M.options = M.default_options

---set user options for the colorscheme
---@param opts AbyssOptions
function M.set_options(opts)
  opts = opts or {}
  M.options = vim.tbl_deep_extend("keep", opts, M.default_options)
end

return M
