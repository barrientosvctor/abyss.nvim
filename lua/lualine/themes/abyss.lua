local colors = require("abyss.palettes.abyss").palette
local common_b = { fg = colors.white, bg = colors.darkblue }
local common_c = { fg = colors.fg0, bg = colors.bg1 }
local common_inactive = { fg = colors.fg0, bg = colors.bg1 }

return {
  normal = {
    a = { fg = colors.bg1, bg = colors.shinyblue, gui = "bold" },
    b = common_b,
    c = common_c,
  },
  visual = {
    a = { fg = colors.bg1, bg = colors.yellow, gui = "bold" },
    b = common_b,
    c = common_c,
  },
  replace = {
    a = { fg = colors.bg1, bg = colors.red, gui = "bold" },
    b = common_b,
    c = common_c,
  },
  insert = {
    a = { fg = colors.bg1, bg = colors.darkgreen, gui = "bold" },
    b = common_b,
    c = common_c,
  },
  command = {
    a = { fg = colors.bg1, bg = colors.purple, gui = "bold" },
    b = common_b,
    c = common_c,
  },
  terminal = {
    a = { fg = colors.bg1, bg = colors.darkgreen, gui = "bold" },
    b = common_b,
    c = common_c,
  },
  inactive = {
    a = common_inactive,
    b = common_inactive,
    c = common_inactive,
  },
}
