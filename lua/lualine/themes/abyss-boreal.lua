local colors = require("abyss.palettes.abyss-boreal").palette

return {
  normal = {
    a = { fg = colors.black, bg = colors.darkteal, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
  visual = {
    a = { fg = colors.black, bg = colors.coral, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
  replace = {
    a = { fg = colors.black, bg = colors.darkred, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
  insert = {
    a = { fg = colors.white, bg = colors.darkpurple, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
  command = {
    a = { fg = colors.black, bg = colors.aurorayellow, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
  terminal = {
    a = { fg = colors.black, bg = colors.aurorayellow, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
  inactive = {
    a = { fg = colors.midblue, bg = colors.bg1, gui = "bold" },
    b = { fg = colors.white, bg = colors.lowgrey },
    c = { fg = colors.white, bg = colors.black },
  },
}
