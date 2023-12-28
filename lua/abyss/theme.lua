local theme = {}
local colors = require("abyss.colors")
local highlight = vim.api.nvim_set_hl

-- All syntax groups: https://neovim.io/doc/user/syntax.html#group-name
-- All highlight groups: https://neovim.io/doc/user/syntax.html#highlight-groups
-- Documentation about `vim.api.nvim_set_hl()` function: https://neovim.io/doc/user/api.html#nvim_set_hl()
-- All treesitter captures: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
-- All treesitter captures linked by default to standard group names: https://neovim.io/doc/user/treesitter.html#treesitter-highlight

function theme.loadSyntax()
	highlight(0, "Comment", { fg = colors.midblue, italic = true })

	highlight(0, "Constant", { fg = colors.fg })
	highlight(0, "String", { fg = colors.darkgreen })
	highlight(0, "Character", { link = "String" })
	highlight(0, "Number", { fg = colors.pink })
	highlight(0, "Boolean", { fg = colors.pink })
	highlight(0, "Float", { link = "Number" })

	highlight(0, "Identifier", { fg = colors.fg })
	highlight(0, "Function", { fg = colors.yellow })

	highlight(0, "Statement", { fg = colors.darkgrey })

	highlight(0, "PreProc", { fg = colors.darkgrey })

	highlight(0, "Type", { fg = colors.purple, italic = true })
	highlight(0, "StorageClass", { fg = colors.darkgrey })
	highlight(0, "Structure", { fg = colors.purple })

	highlight(0, "Special", { fg = colors.yellow })
	highlight(0, "SpecialChar", { fg = colors.pink })
	highlight(0, "Delimiter", { fg = colors.fg })
	highlight(0, "SpecialComment", { fg = colors.purple })
	highlight(0, "Debug", { fg = colors.darkgrey })

	highlight(0, "Underlined", { underline = true })

	highlight(0, "Ignore", { fg = colors.darkgrey })

	highlight(0, "Error", { fg = colors.red, bold = true, underline = true })

	highlight(0, "Todo", { fg = colors.heavyyellow, bg = colors.darkred, bold = true })

	highlight(0, "markdownURL", { fg = colors.darkgreen, underline = true })
end

function theme.loadEditor()
	highlight(0, "ColorColumn", { fg = colors.none, bg = colors.darkred })
	highlight(0, "Conceal", { fg = colors.fg, bg = colors.none })

	highlight(0, "Cursor", { fg = colors.midblue, bg = colors.darkred, reverse = true })
	highlight(0, "lCursor", { link = "Cursor" })
	highlight(0, "CursorIM", { fg = colors.lowgrey, bg = colors.darkred, reverse = true })
	highlight(0, "CursorLine", { fg = colors.none, bg = colors.darkblue })
	highlight(0, "CursorLineNr", { fg = colors.lightgrey, bg = colors.bg })
	highlight(0, "CursorColumn", { link = "CursorLine" })

	highlight(0, "Directory", { fg = colors.heavyyellow, bg = colors.none })

	highlight(0, "DiffAdd", { fg = colors.darkgreen })
	highlight(0, "DiffChange", { fg = colors.yellow })
	highlight(0, "DiffDelete", { fg = colors.red })
	highlight(0, "DiffText", { fg = colors.red, italic = true })
	highlight(0, "diffAdded", { link = "DiffAdd" })
	highlight(0, "diffRemoved", { link = "DiffDelete" })
	highlight(0, "diffChanged", { link = "DiffChange" })
	highlight(0, "diffOldFile", { link = "DiffDelete" })
	highlight(0, "diffNewFile", { link = "DiffAdd" })
	highlight(0, "diffFile", { fg = colors.red, bg = colors.none, bold = true })
	highlight(0, "diffLine", { link = "diffFile" })
	highlight(0, "diffIndexLine", { fg = colors.orange, bg = colors.none })

	highlight(0, "healthError", { fg = colors.red })
	highlight(0, "healthSuccess", { fg = colors.green })
	highlight(0, "healthWarning", { fg = colors.yellow })

	highlight(0, "NonText", { fg = colors.bg, bg = colors.bg })
	highlight(0, "EndOfBuffer", { link = "NonText" })

	highlight(0, "VertSplit", { fg = colors.fg, bg = colors.bg })

	highlight(0, "ErrorMsg", { fg = colors.red })
	highlight(0, "WarningMsg", { fg = colors.heavyyellow })

	highlight(0, "Folded", { fg = colors.darkgrey, bg = colors.none, italic = true })
	highlight(0, "FoldColumn", { bg = colors.bg_completion_sel })
	highlight(0, "SignColumn", { fg = colors.fg, bg = colors.bg })

	highlight(0, "IncSearch", { fg = colors.black, bg = colors.yellow })
	highlight(0, "Substitute", { link = "IncSearch" })

	highlight(0, "LineNr", { fg = colors.lowgrey, bg = colors.bg })
	highlight(0, "LineNrAbove", { fg = colors.lowgrey, bg = colors.bg })
	highlight(0, "LineNrBelow", { link = "LineNrAbove" })

	highlight(0, "MatchParen", { fg = colors.heavyyellow, bg = colors.darkred })

	highlight(0, "MsgArea", { fg = colors.white })
	highlight(0, "ModeMsg", { link = "MsgArea" })
	highlight(0, "MoreMsg", { link = "MsgArea" })

	highlight(0, "Normal", { fg = colors.fg, bg = colors.bg })
	highlight(0, "NormalNC", { link = "Normal" })
	highlight(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_alt })
	highlight(0, "FloatBorder", { link = "NormalFloat" })

	highlight(0, "Pmenu", { fg = colors.fg, bg = colors.bg_completion })
	highlight(0, "PmenuSbar", { bg = colors.bg_completion })
	highlight(0, "PmenuSel", { fg = colors.white, bg = colors.bg_completion_sel })
	highlight(0, "PmenuThumb", { bg = colors.lightgrey })

	highlight(0, "Question", { fg = colors.yellow })

	highlight(0, "QuickFixLine", { fg = colors.none, bg = colors.darkred })

	highlight(0, "Search", { fg = colors.black, bg = colors.yellow })
	highlight(0, "SpecialKey", { fg = colors.heavyyellow, bg = colors.none })

	highlight(0, "SpellBad", { fg = colors.darkred, undercurl = true })
	highlight(0, "SpellRare", { fg = colors.yellow, undercurl = true })
	highlight(0, "SpellCap", { fg = colors.yellow, underline = true })
	highlight(0, "SpellLocal", { fg = colors.orange, underline = true })

	highlight(0, "StatusLine", { fg = colors.none, bg = colors.bg })
	highlight(0, "StatusLineNC", { fg = colors.none, bg = colors.black })

	highlight(0, "TabLine", { fg = colors.lightgrey, bg = colors.bg })
	highlight(0, "TabLineFill", { fg = colors.none, bg = colors.bg })
	highlight(0, "TabLineSel", { fg = colors.white, bg = colors.darkblue })

	highlight(0, "Title", { fg = colors.heavyyellow, underline = true, bold = true })

	highlight(0, "Visual", { fg = colors.none, bg = colors.darkred })
	highlight(0, "VisualNOS", { link = "Visual" })

	highlight(0, "Whitespace", { fg = colors.bg, bg = colors.none })

	highlight(0, "WildMenu", { fg = colors.bg, bg = colors.fg })

	highlight(0, "WinBar", { fg = colors.white, bg = colors.bg })
	highlight(0, "WinBarNC", { fg = colors.fg, bg = colors.bg })
end

function theme.loadTerminal()
	vim.g.terminal_color_0 = colors.bg
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.darkgreen
	vim.g.terminal_color_3 = colors.green
	vim.g.terminal_color_4 = colors.darkblue
	vim.g.terminal_color_5 = colors.purple
	vim.g.terminal_color_6 = colors.darkgreen
	vim.g.terminal_color_7 = colors.lightgrey
	vim.g.terminal_color_8 = colors.heavyyellow
	vim.g.terminal_color_9 = colors.shinyblue
	vim.g.terminal_color_10 = colors.midblue
	vim.g.terminal_color_11 = colors.orange
	vim.g.terminal_color_12 = colors.red
	vim.g.terminal_color_13 = colors.darkred
	vim.g.terminal_color_14 = colors.orange
	vim.g.terminal_color_15 = colors.yellow

	highlight(0, "TermCursor", { fg = colors.none, bg = colors.white })
	highlight(0, "TermCursorNC", { fg = colors.none, bg = colors.fg })
end

function theme.loadTreeSitter()
	-- Misc
	highlight(0, "@comment", { link = "Comment" })
	highlight(0, "@error", { link = "Error" })

	-- Punctuation
	highlight(0, "@punctuation.delimiter", { link = "Delimiter" })
	highlight(0, "@punctuation.bracket", { fg = colors.fg })
	highlight(0, "@punctuation.special", { fg = colors.darkgrey })

	highlight(0, "@constructor", { fg = colors.yellow })
	highlight(0, "@field", { fg = colors.fg })
	highlight(0, "@variable", { fg = colors.fg })
	highlight(0, "@property", { fg = colors.fg })
	highlight(0, "@parameter", { fg = colors.shinyblue, italic = true })
	highlight(0, "@function", { fg = colors.yellow })
	highlight(0, "@function.call", { link = "@function" })
	highlight(0, "@function.builtin", { link = "@function" })
	highlight(0, "@function.macro", { link = "@function" })
	highlight(0, "@constant", { link = "Constant" })
	highlight(0, "@constant.builtin", { link = "Constant" })
	highlight(0, "@constant.macro", { link = "Constant" })
	highlight(0, "@parameter.reference", { link = "@parameter" })
	highlight(0, "@exception", { link = "Exception" })
end

function theme.loadLSP()
	highlight(0, "DiagnosticError", { fg = colors.red })
	highlight(0, "DiagnosticWarn", { fg = colors.heavyyellow })
	highlight(0, "DiagnosticInfo", { fg = colors.shinyblue })
	highlight(0, "DiagnosticHint", { fg = colors.white })
	highlight(0, "DiagnosticTruncateLine", { fg = colors.fg })

	highlight(0, "DiagnosticUnderlineError", { sp = colors.red, undercurl = true })
	highlight(0, "DiagnosticUnderlineWarn", { sp = colors.heavyyellow, undercurl = true })
	highlight(0, "DiagnosticUnderlineInfo", { sp = colors.shinyblue, undercurl = true })
	highlight(0, "DiagnosticUnderlineHint", { sp = colors.white, undercurl = true })

	highlight(0, "LspDiagnosticsError", { fg = colors.red })
	highlight(0, "LspDiagnosticsWarning", { fg = colors.yellow })
	highlight(0, "LspDiagnosticsInformation", { fg = colors.shinyblue })
	highlight(0, "LspDiagnosticsHint", { fg = colors.white })
end

function theme.loadPlugins()
	-- Telescope
	highlight(0, "TelescopeNormal", { fg = colors.fg })
	highlight(0, "TelescopePrompt", { link = "TelescopeNormal" })
	highlight(0, "TelescopePromptBorder", { fg = colors.fg })
	highlight(0, "TelescopeResultsBorder", { link = "TelescopePromptBorder" })
	highlight(0, "TelescopePreviewBorder", { link = "TelescopePromptBorder" })
	highlight(0, "TelescopeSelectionCaret", { fg = colors.white })
	highlight(0, "TelescopePromptPrefix", { link = "TelescopeSelectionCaret" })
	highlight(0, "TelescopeSelection", { link = "TelescopeSelectionCaret" })
	highlight(0, "TelescopeMultiSelection", { link = "TelescopeSelectionCaret" })
	highlight(0, "TelescopeMatching", { fg = colors.yellow })
	highlight(0, "TelescopePromptCounter", { fg = colors.fg })
	highlight(0, "TelescopePreviewHyphen", { link = "TelescopePromptCounter" })

	-- nvim-cmp
	highlight(0, "CmpItemKind", { fg = colors.heavyyellow })
	highlight(0, "CmpItemAbbrMatch", { fg = colors.yellow, bold = true })
	highlight(0, "CmpItemAbbrMatchFuzzy", { fg = colors.lightgrey, bold = true })
	highlight(0, "CmpItemAbbr", { fg = colors.lighgrey })
	highlight(0, "CmpItemMenu", { fg = colors.heavyyellow })
	highlight(0, "CmpItemKindText", { fg = colors.darkgreen })
	highlight(0, "CmpItemKindMethod", { fg = colors.yellow })
	highlight(0, "CmpItemKindFunction", { link = "CmpItemKindMethod" })
	highlight(0, "CmpItemKindConstructor", { link = "CmpItemKindMethod" })
	highlight(0, "CmpItemKindField", { fg = colors.fg })
	highlight(0, "CmpItemKindVariable", { link = "CmpItemKindField" })
	highlight(0, "CmpItemKindClass", { fg = colors.heavyyellow })
	highlight(0, "CmpItemKindInterface", { link = "CmpItemKindClass" })
	highlight(0, "CmpItemKindModule", { link = "CmpItemKindField" })
	highlight(0, "CmpItemKindProperty", { fg = colors.shinyblue })
	highlight(0, "CmpItemKindUnit", { link = "CmpItemKindField" })
	highlight(0, "CmpItemKindValue", { link = "CmpItemKindText" })
	highlight(0, "CmpItemKindEnum", { link = "CmpItemKindField" })
	highlight(0, "CmpItemKindKeyword", { link = "CmpItemKindField" })
	highlight(0, "CmpItemKindSnippet", { fg = colors.orange })
	highlight(0, "CmpItemKindColor", { link = "CmpItemKindProperty" })
	highlight(0, "CmpItemKindFile", { fg = colors.red })
	highlight(0, "CmpItemKindReference", { link = "CmpItemKindMethod" })
	highlight(0, "CmpItemKindFolder", { fg = colors.darkred })
	highlight(0, "CmpItemKindEnumMember", { link = "CmpItemKindField" })
	highlight(0, "CmpItemKindConstant", { fg = colors.purple })
	highlight(0, "CmpItemKindStruct", { link = "CmpItemKindClass" })
	highlight(0, "CmpItemKindEvent", { link = "CmpItemKindMethod" })
	highlight(0, "CmpItemKindOperator", { fg = colors.pink })
	highlight(0, "CmpItemKindTypeParameter", { link = "CmpItemKindProperty" })

	-- gitsigns
	highlight(0, "GitSignsAddLn", { fg = colors.darkgreen })
	highlight(0, "GitSignsAddNr", { fg = colors.darkgreen })
	highlight(0, "GitSignsChangeLn", { fg = colors.yellow })
	highlight(0, "GitSignsChangeNr", { fg = colors.yellow })
	highlight(0, "GitSignsDeleteLn", { fg = colors.darkred })
	highlight(0, "GitSignsDeleteNr", { fg = colors.darkred })
	highlight(0, "GitSignsCurrentLineBlame", { fg = colors.orange, bold = true })

	-- git gutter
	highlight(0, "GitGutterAdd", { fg = colors.green })
	highlight(0, "GitGutterChange", { fg = colors.yellow })
	highlight(0, "GitGutterDelete", { fg = colors.red })
	highlight(0, "GitGutterChangeDelete", { fg = colors.red })

	-- lspsaga
	highlight(0, "LspFloatWinNormal", { bg = colors.bg })
	highlight(0, "LspFloatWinBorder", { fg = colors.fg })
	highlight(0, "LspSagaBorderTitle", { fg = colors.yellow })
	highlight(0, "LspSagaHoverBorder", { fg = colors.yellow })
	highlight(0, "LspSagaRenameBorder", { fg = colors.orange })
	highlight(0, "LspSagaDefPreviewBorder", { fg = colors.yellow })
	highlight(0, "LspSagaCodeActionBorder", { fg = colors.red })
	highlight(0, "LspSagaFinderSelection", { fg = colors.heavyyellow })
	highlight(0, "LspSagaCodeActionTitle", { fg = colors.yellow })
	highlight(0, "LspSagaCodeActionContent", { fg = colors.fg })
	highlight(0, "LspSagaSignatureHelpBorder", { fg = colors.orange })
	highlight(0, "ReferencesCount", { fg = colors.white })
	highlight(0, "DefinitionCount", { fg = colors.fg })
	highlight(0, "DefinitionIcon", { fg = colors.shinyblue })
	highlight(0, "ReferencesIcon", { fg = colors.yellow })
	highlight(0, "TargetWord", { fg = colors.red })

	-- nvim-tree
	highlight(0, "NvimTreeRootFolder", { fg = colors.heavyyellow, bold = true })
	highlight(0, "NvimTreeGitDirty", { fg = colors.orange })
	highlight(0, "NvimTreeGitNew", { fg = colors.green })
	highlight(0, "NvimTreeImageFile", { fg = colors.pink })
	highlight(0, "NvimTreeExecFile", { fg = colors.fg })
	highlight(0, "NvimTreeSpecialFile", { fg = colors.yellow, underline = true })
	highlight(0, "NvimTreeFolderName", { fg = colors.fg })
	highlight(0, "NvimTreeEmptyFolderName", { fg = colors.fg })
	highlight(0, "NvimTreeFolderIcon", { fg = colors.shinyblue })
	highlight(0, "NvimTreeIndentMarker", { fg = colors.white })

	-- packer
	highlight(0, "packerString", { fg = colors.darkgreen, bg = colors.none })
	highlight(0, "packerHash", { fg = colors.yellow, bg = colors.none, bold = true })
	highlight(0, "packerRelDate", { fg = colors.lightgrey, bold = true, underline = true })
	highlight(0, "packerSuccess", { fg = colors.green, bg = colors.none, bold = true })
	highlight(0, "packerStatusSuccess", { link = "PackerSuccess" })

	-- indent blankline
	highlight(0, "IndentBlanklineChar", { fg = colors.lowgrey })
	highlight(0, "IndentBlanklineContextChar", { fg = colors.shinyblue })

	-- neo-tree
	highlight(0, "NeoTreeRootName", { fg = colors.fg, bold = true })

	-- notify
	highlight(0, "NotifyERROR", { fg = colors.red })
	highlight(0, "NotifyWARN", { fg = colors.yellow })
	highlight(0, "NotifyINFO", { fg = colors.fg })
	highlight(0, "NotifyDEBUG", { fg = colors.midblue })
	highlight(0, "NotifyTRACE", { fg = colors.lightgrey })
	highlight(0, "NotifyERRORTitle", { link = "NotifyERROR" })
	highlight(0, "NotifyWARNTitle", { link = "NotifyWARN" })
	highlight(0, "NotifyINFOTitle", { link = "NotifyINFO" })
	highlight(0, "NotifyDEBUGTitle", { link = "NotifyDEBUG" })
	highlight(0, "NotifyTRACETitle", { link = "NotifyTRACE" })

	-- dashboard
	highlight(0, "DashboardShortCut", { fg = colors.orange })
	highlight(0, "DashboardHeader", { fg = colors.darkgreen })
	highlight(0, "DashboardCenter", { fg = colors.heavyyellow })
	highlight(0, "DashboardFooter", { fg = colors.fg, italic = true })
end

return theme
