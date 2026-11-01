local colors = require("abyss.palettes.abyss").palette

return {
  normal = {
    a = { fg = colors.white, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
  visual = {
    a = { fg = colors.shinyblue, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
  replace = {
    a = { fg = colors.red, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
  insert = {
    a = { fg = colors.darkgreen, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
  command = {
    a = { fg = colors.purple, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
  terminal = {
    a = { fg = colors.yellow, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
  inactive = {
    a = { fg = colors.midblue, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.fg0, bg = colors.bg1 },
    c = { fg = colors.fg0, bg = colors.bg1 },
  },
}
