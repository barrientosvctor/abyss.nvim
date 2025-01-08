local M = {}
local api = require("abyss.lib.api")

---Gets the palette taking as input the name of the palette file.
---@param name string
---@return Spec
function M.get_spec_from_palette(name)
  local ok, pal = pcall(require, "abyss.palettes." .. name)
  if not ok then api.notify("Abyss.nvim: " .. name .. " palette not found. Applying default palette...", vim.log.levels.ERROR) end
  return ok == true and pal or require("abyss.palettes.abyss")
end

return M
