local colors = {
  fg = "#6688cc",
  bg_alt = "#000C38",
  white = "#FFFFFF",
  red = "#cb4444",
  darkgreen = "#22aa44",
  purple = "#9966b8",
  yellow = "#ddbb88",
  midblue = "#384887"
}

return {
  normal = {
    a = { fg = colors.white, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
  visual = {
    a = { fg = colors.shinyblue, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
  replace = {
    a = { fg = colors.red, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
  insert = {
    a = { fg = colors.darkgreen, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
  command = {
    a = { fg = colors.purple, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
  terminal = {
    a = { fg = colors.yellow, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
  inactive = {
    a = { fg = colors.midblue, bg = colors.bg_alt, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg_alt },
  },
}
