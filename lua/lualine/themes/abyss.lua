local colors = require('abyss.colors')

return {
    normal = {
	a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
    visual = {
	a = { fg = colors.orange, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
    replace = {
	a = { fg = colors.red, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
    insert = {
	a = { fg = colors.darkgreen, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
    command = {
	a = { fg = colors.purple, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
    terminal = {
	a = { fg = colors.yellow, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
    inactive = {
	a = { fg = colors.midblue, bg = colors.bg, gui = "bold" },
	b = { fg = colors.fg, bg = colors.bg },
	c = { fg = colors.fg, bg = colors.bg },
    },
}
