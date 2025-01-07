local palette = {
  bg0 = "#060024", -- Background
  bg1 = "#282049", -- Cursorline background
  bg00 = "#262641",
  bg01 = "#08286b",
  fg0 = "#8c63c9", -- Foreground
  fg1 = "#3D276F",
  lime = "#8AED07", -- success text color
  midteal = "#2082a6",
  darkteal = "#005d55", -- strings
  cerulean = "#49D2E2",
  darkpurple = "#5504b8", -- active cursor line background
  lilac = "#d991d4", -- all JSDoc
  darkpink = "#FA3C95", -- functions color
  lightpink = "#fcacc1",
  coral = "#C74767",
  shinypurple = "#d00afc", -- numbers, booleans etc.
  orange = "#FF7F50",
  aurorayellow = "#d9bb62",
  red = "#ff002f", -- error text color
  darkred = "#470b1b",
  lowgrey = "#406385", -- inactive cursor line numbers
  midblue = "#384887",
  shinyblue = "#1f45db", -- parameters color
  white = "#A3D7DA",
  black = "#202020",
  darkgrey = "#225588", -- statements and symbols

  -- Terminal --
  color0 = '#121212',
  color1 = '#A52AFF',
  color2 = '#7129FF',
  color3 = '#3D2AFF',
  color4 = '#2B4FFF',
  color5 = '#881798',
  color6 = '#28B9FF',
  color7 = '#F1F1F1',
  color8 = '#666666',
  color9 = '#BA5AFF',
	color10 = '#905AFF',
	color11 = '#4D4FFF',
  color12 = '#5C78FF',
  color13 = '#B4009E',
  color14 = '#5AC8FF',
  color15 = '#FFFFFF',
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
    cursor = palette.white,
    cursorline = palette.bg1,
    cursor_selection = palette.darkred,
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
    color0 = palette.color0,
    color1 = palette.color1,
    color2 = palette.color2,
    color3 = palette.color3,
    color4 = palette.color4,
    color5 = palette.color5,
    color6 = palette.color6,
    color7 = palette.color7,
    color8 = palette.color8,
    color9 = palette.color9,
    color10 = palette.color10,
    color11 = palette.color11, --was orange
    color12 = palette.color12,
    color13 = palette.color13,
    color14 = palette.color14, --was orange
    color15 = palette.color15,
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
    replacebg_a = palette.darkred,

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
