local palette = {
  bg0 = "#0d072b", -- Background
  bg1 = "#282049", -- Cursorline background
  bg00 = "#262641",
  bg01 = "#08286b",
  fg0 = "#8751d6", -- Foreground
  fg1 = "#3D276F",
  lime = "#8AED07", -- success text color
  midteal = "#2082a6",
  darkteal = "#005d55", -- strings
  cerulean = "#49D2E2",
  darkpurple = "#5504b8", -- active cursor line background
  lilac = "#d991d4", -- all JSDoc
  darkpink = "#FA3C95", -- functions color
  lightpink = "#FAD2DD",
  coral = "#C74767",
  shinypurple = "#d00afc", -- numbers, booleans etc.
  orange = "#FF7F50",
  aurorayellow = "#d9bb62",
  red = "#ff002f", -- error text color

  lowgrey = "#406385", -- inactive cursor line numbers
  midblue = "#384887",
  shinyblue = "#1f45db", -- parameters color
  white = "#A3D7DA",
  black = "#202020",

  -- TO DELETE --
  darkred = "#470b1b",
  lightgrey = "#80A2B7", -- active cursor line
  darkgrey = "#225588", -- statements and symbols
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
    cursor = palette.lightpink,
    cursorline = palette.midteal,
    cursor_selection = palette.darkpurple,
    title = palette.white,
    match = palette.darkpink,
    match_selected = palette.lightpink,
    nontext = palette.darkgrey,
    linenr = palette.lowgrey,
  },
  syntax = {
    identifier = palette.fg1,
    structure = palette.orange,
    statement = palette.cerulean,
    constant = palette.fg0,
    special = palette.lime,
    comment = palette.midblue,
    string = palette.darkteal,
    regex = palette.shinypurple,
    type = palette.lilac,
    number = palette.shinypurple,
    func = palette.coral,
    bracket = palette.fg0,
    parameter = palette.shinyblue,
  },
  diff = {
    added = palette.lime,
    changed = palette.coral,
    deleted = palette.red,
    text = palette.darkpink,
    untracked = palette.shinypurple,
  },
  diagnostics = {
    error = palette.red,
    ok = palette.lime,
    hint = palette.lightpink,
    info = palette.white,
    warn = palette.aurorayellow,
  },
  dirtree = {
    rootname = palette.white,
    dirname = palette.darkteal,
    curline = palette.cerulean,
  },
  terminal = {
    -- REPLACE WITH THE "MYSTIC NIGHT" TERMINAL colors??
    color0 = palette.bg0,
    color1 = palette.red,
    color2 = palette.darkteal,
    color3 = palette.lime,
    color4 = palette.darkblue,
    color5 = palette.lilac,
    color6 = palette.darkteal,
    color7 = palette.lightgrey,
    color8 = palette.lightpink,
    color9 = palette.red,
    color10 = palette.midblue,
    color11 = palette.orange, --was orange
    color12 = palette.red,
    color13 = palette.darkred,
    color14 = palette.orange, --was orange
    color15 = palette.darkpink,
  },
  lualine = {
    basebg_b = palette.lowgrey,
    basebg_c = palette.black,
    base_fg = palette.white,

    normalfg = palette.black,
    normalbg_a = palette.darkteal,

    visualfg = palette.black,
    visualbg_a = palette.coral,

    replacefg = palette.black,
    replacebg_a = palette.lightgrey,

    insertfg = palette.white,
    insertbg_a  = palette.darkpurple,

    commandfg = palette.black,
    commandbg_a = palette.aurorayellow,

    terminalfg = palette.black,
    terminalbg_a = palette.aurorayellow,

    inactivefg = palette.midblue,
    inactivebg_a = palette.bg1,

  },
}

return spec
