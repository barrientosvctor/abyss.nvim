local util = {}
local abyss = require("abyss.theme")

function util.highlight(group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""

    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
    vim.cmd(hl)

    if color.link then
	vim.cmd("highlight! link " .. group .. " " .. color.link)
    end
end

function util.loadColorSet(colorSet)
    for group, colors in pairs(colorSet) do
        util.highlight(group, colors)
    end
end

function util.load()
    if vim.g.colors_name then
	vim.cmd("hi clear")
    end

    if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "abyss"

    -- Load syntax
    util.loadColorSet(abyss.loadSyntax())
    --- Load editor colors
    util.loadColorSet(abyss.loadEditor())
    -- Load terminal
    abyss.loadTerminal()
    util.loadColorSet(abyss.loadCursorTerminal())
    -- Load treesitter
    util.loadColorSet(abyss.loadTreeSitter())
    -- Load plugin colors configuration
    util.loadColorSet(abyss.loadPlugins())
    -- Load LSP
    util.loadColorSet(abyss.loadLSP())
end

return util
