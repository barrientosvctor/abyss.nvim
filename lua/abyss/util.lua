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

    if (type(user_opts.overrides) ~= "nil" and type(user_opts.overrides) == "table") then
        if util.table_length(user_opts.overrides) == 0 then return end

        for key, opts in pairs(user_opts.overrides) do
            vim.api.nvim_set_hl(0, key, opts)
        end
    end

end

---Return the length of the table passed by parameter.
---@param tbl table
function util.table_length(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

return util
