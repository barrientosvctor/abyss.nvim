local palette = {
  bg0 = "#000c18", -- Background
  bg1 = "#000C38", -- Cursorline background
  bg00 = "#262641",
  bg01 = "#08286B",
  fg0 = "#6688cc", -- Foreground
  fg1 = "#283D60",
  darkgreen = "#22aa44", -- strings
  green = "#44cb46", -- success text color
  darkblue = "#082050", -- active cursor line background
  purple = "#9966b8", -- all JSDoc
  pink = "#f280d0", -- numbers, booleans etc.
  lightgrey = "#80A2B7", -- active cursor line
  lowgrey = "#406385", -- inactive cursor line numbers
  darkgrey = "#225588", -- statements and symbols
  midblue = "#384887",
  shinyblue = "#2277ff", -- parameters color
  red = "#cb4444", -- error text color
  darkred = "#770811",
  orange = "#FF9900",
  yellow = "#ddbb88", -- functions color
  heavyyellow = "#FFEEBB",
  white = "#FFFFFF",
  black = "#000000",
}

---@type Spec
local spec = {
  base = {
    bg0 = palette.bg0,
    bg1 = palette.bg1,
    bg2 = palette.black,
    bg00 = palette.bg00,
    bg01 = palette.bg01,
    fg0 = palette.fg0,
    fg1 = palette.fg1,
    fg2 = palette.lowgrey,
    fg00 = palette.fg0,
    fg01 = palette.white,
  },
  editor = {
    cursor = palette.heavyyellow,
    cursorline = palette.darkblue,
    cursor_selection = palette.darkred,
    title = palette.white,
    match = palette.yellow,
    match_selected = palette.heavyyellow,
    nontext = palette.darkgrey,
    linenr = palette.lowgrey,
  },
  syntax = {
    identifier = palette.fg1,
    structure = palette.heavyyellow,
    statement = palette.darkgrey,
    constant = palette.fg0,
    special = palette.darkgrey,
    comment = palette.midblue,
    string = palette.darkgreen,
    regex = palette.pink,
    type = palette.purple,
    number = palette.pink,
    func = palette.yellow,
    bracket = palette.fg0,
    parameter = palette.shinyblue,
  },
  diff = {
    added = palette.green,
    changed = palette.yellow,
    deleted = palette.red,
    text = palette.red,
    untracked = palette.orange,
  },
  diagnostics = {
    error = palette.red,
    ok = palette.green,
    hint = palette.shinyblue,
    info = palette.white,
    warn = palette.yellow,
  },
  dirtree = {
    rootname = palette.white,
    dirname = palette.heavyyellow,
    curline = palette.heavyyellow,
  },
  terminal = {
    color0 = palette.bg0,
    color1 = palette.red,
    color2 = palette.darkgreen,
    color3 = palette.green,
    color4 = palette.darkblue,
    color5 = palette.purple,
    color6 = palette.darkgreen,
    color7 = palette.lightgrey,
    color8 = palette.heavyyellow,
    color9 = palette.red,
    color10 = palette.midblue,
    color11 = palette.orange,
    color12 = palette.red,
    color13 = palette.darkred,
    color14 = palette.orange,
    color15 = palette.yellow,
  },
}

return spec
