local colors = require("abyss.palettes.abyss-boreal")

return {
  normal = {
    a = { fg = colors.lualine.normalfg, bg = colors.lualine.normalbg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
  visual = {
    a = { fg = colors.lualine.visualfg, bg = colors.lualine.visualbg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
  replace = {
    a = { fg = colors.lualine.replacefg, bg = colors.lualine.replacebg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
  insert = {
    a = { fg = colors.lualine.insertfg, bg = colors.lualine.insertbg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
  command = {
    a = { fg = colors.lualine.commandfg, bg = colors.lualine.commandbg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
  terminal = {
    a = { fg = colors.lualine.terminalfg, bg = colors.lualine.terminalbg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
  inactive = {
    a = { fg = colors.lualine.inactivefg, bg = colors.lualine.inactivebg_a, gui = "bold" },
    b = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_b },
    c = { fg = colors.lualine.base_fg, bg = colors.lualine.basebg_c },
  },
}
