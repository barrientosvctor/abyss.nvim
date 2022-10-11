local theme = {}
local colors = require("abyss.colors")

function theme.loadSyntax()
    -- Syntax highlight groups
    local syntax = {
	String = { fg = colors.darkgreen }, -- a string constant: "this is a string"
	Comment = { fg = colors.midblue, style = "italic" }, -- any comment
	Number = { fg = colors.pink }, -- a number constant: 234, 0xff
	Float = { fg = colors.pink }, -- a floating point constant: 2.3e10
	Keyword = { fg = colors.darkgrey }, -- -- normal for, do, while, etc.
	Field = { fg = colors.fg },
	Repeat = { link = "Keyword" }, -- any other repeat keyword.
	Boolean = { fg = colors.pink }, -- a boolean constant: true, false
	Variable = { fg = colors.fg }, -- any variable
	Character = { fg = colors.lightgrey }, -- a character constant: 'c', '\n'
	Statement = { fg = colors.darkgrey }, -- any statement
	StorageClass = { fg = colors.fg },
	Function = { fg = colors.yellow }, -- any function
	Label = { fg = colors.darkgrey }, -- case, default, etc.
	Operator = { fg = colors.darkgrey }, -- "sizeof", "+", "*", etc.
	Exception = { fg = colors.darkgrey }, -- try, catch, throw etc.
	Type = { fg = colors.heavyyellow, style = "underline" }, -- int, long, chat etc.
	Constant = { fg = colors.yellow, style = "underline" }, -- any constant
	SpecialChar = { fg = colors.yellow, style = "underline" }, -- special character in a constant
	Typedef = { fg = colors.purple, style = "italic" }, -- A typedef
	Structure = { fg = colors.purple }, -- struct, union, enum etc.
	PreProc = { fg = colors.darkgrey }, -- generic Preprocessor
	Include = { fg = colors.darkgrey }, -- preprocessor #include
	Define = { fg = colors.darkgrey }, -- preprocessor #define
	Macro = { fg = colors.darkgrey }, -- same as Define
	PreCondit = { fg = colors.darkgrey }, -- preprocessor #if, #else, #endif, etc.
	Special = { fg = colors.pink }, -- any special symbol
	Underlined = { fg = colors.darkgreen, bg = colors.none, style = "underline" }, -- text that stands out, HTML links
	Conceal = { fg = colors.none, bg = colors.bg }, -- Placeholder characters substituted for concealed text (see 'conceallevel').
	Todo = { fg = colors.heavyyellow, bg = colors.none, style = "italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	Tag = { fg = colors.darkgrey },
	Escape = { fg = colors.pink },
	Delimiter = { fg = colors.midblue }, -- character that needs attention like , or .
	SpecialComment = { fg = colors.purple }, -- special things inside a comment
	Debug = { fg = colors.darkgrey }, -- debugging statements
	Error = { fg = colors.red, bg = colors.none, style = "bold,underline" }, -- any erroneous construct
	Ignore = { fg = colors.darkgrey }, -- left blank, hidden

	-- TOML
	tomlKey = { fg = colors.fg },

	-- PHP
	phpRegion = { fg = colors.fg },
	phpIdentifier = { fg = colors.fg },
    }
    return syntax
end

function theme.loadEditor()
    -- Editor highlight groups
    local editor = {
	Normal = { bg = colors.bg, fg = colors.fg }, -- normal text and background color
	NormalNC = { link = "Normal" }, -- Normal text in non-current windows.
	NormalFloat = { fg = colors.fg, bg = colors.black }, -- normal text and background color
	FloatBorder = { fg = colors.fg, bg = colors.black }, -- normal text and background color
	SignColumn = { bg = colors.bg, fg = colors.fg }, -- used for the columns set with 'colorcolumn'
	Question = { fg = colors.yellow, bg = colors.none }, -- hit-enter prompt and yes/no questions.
	Title = { fg = colors.heavyyellow, style = "underline,italic" }, -- Titles for output from ":set all", ":autocmd" etc.
	Pmenu = { bg = colors.bg, fg = colors.fg }, -- Popup menu: Normal item.
	PmenuSbar = { link = "Pmenu" }, -- Popup menu: Scrollbar.
	PmenuSel = { bg = colors.fg, fg = colors.bg }, -- Popup menu: Selected item.
	PmenuThumb = { bg = colors.lightgrey, fg = colors.white }, -- Popup menu: Thumb of the scrollbar.
	ColorColumn = { bg = colors.bg, fg = colors.fg }, -- column color
	LineNR = { bg = colors.bg, fg = colors.lowgrey }, -- inactive cursor line numbers
	LineNrAbove = { bg = colors.bg, fg = colors.lowgrey }, -- Line number for when the 'relativenumber' option is set, above the cursor line.
	LineNrBelow = { link = "LineNrAbove" }, -- Line number for when the 'relativenumber' option is set, below the cursor line.
	StatusLine = { bg = colors.bg },
	StatusLineNC = { bg = colors.black },
	VertSplit = { fg = colors.fg, bg = colors.bg }, -- Split windows color
	Conceal = { fg = colors.fg }, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = { fg = colors.midblue, bg = colors.darkred, style = "reverse" }, -- the character under the cursor
	lCursor = { fg = colors.midblue, bg = colors.darkred, style = "reverse" }, -- the character under the cursor
	CursorIM = { fg = colors.lowgrey, bg = colors.darkred, style = "reverse" }, -- the character under the cursor
	CursorLine = { bg = colors.darkblue }, -- cursor line border
	CursorLineNR = { bg = colors.bg, fg = colors.lightgrey }, -- active cursor line
	Directory = { fg = colors.heavyyellow, bg = colors.none }, -- directory names (and other special names in listings)
	EndOfBuffer = { fg = colors.lowgrey },
	ErrorMsg = { fg = colors.red, bg = colors.none },
	WarningMsg = { fg = colors.heavyyellow, bg = colors.none }, -- Warning messages. hl-WarningMsg
	Folded = { fg = colors.darkgrey, bg = colors.none, style = "italic" }, -- Line used for closed folds.
	Search = { fg = colors.black, bg = colors.yellow }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
	IncSearch = { fg = colors.black, bg = colors.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c".
	TabLine = { fg = colors.lightgrey, bg = colors.bg }, -- Tab pages line, not active tab page label. hl-TabLine
	TabLineFill = { bg = colors.bg }, -- Tab pages line, where there are no labels. hl-TabLineFill
	TabLineSel = { fg = colors.white, bg = colors.darkblue }, -- Tab pages line, active tab page label. hl-TabLineSel
	Visual = { bg = colors.darkred }, -- Visual mode selection. hl-Visual
	VisualNOS = { link = "Visual" }, -- Visual mode selection when vim is "Not Owning the Selection". hl-VisualNOS
	NonText = { fg = colors.darkgrey }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	MsgArea = { fg = colors.fg }, -- Area for messages and cmdline. hl-MsgArea
	ModeMsg = { link = "MsgArea" }, -- 'showmode' message (e.g., "-- INSERT --"). hl-ModeMsg
	MoreMsg = { link = "ModeMsg" }, -- more-prompt (https://neovim.io/doc/user/message.html#more-prompt)
	MatchParen = { fg = colors.heavyyellow, bg = colors.darkred }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	MatchWordCur = { fg = colors.none, bg = colors.none, style = "underline" },
	MatchParenCur = { link = "MatchWordCur" },
	SpecialKey = { fg = colors.heavyyellow }, -- Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
	SpellBad = { fg = colors.darkred, bg = colors.none, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. hl-SpellBad
	SpellRare = { fg = colors.yellow, bg = colors.none, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
	SpellCap = { fg = colors.yellow, style = "underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	SpellLocal = { fg = colors.orange, style = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	Substitute = { fg = colors.none, bg = colors.darkred }, -- |:substitute| replacement text highlighting. hl-Substitute
	QuickFixLine = { fg = colors.none, bg = colors.darkred }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	WildMenu = { fg = colors.bg, bg = colors.fg }, -- Current match in 'wildmenu' completion. hl-WildMenu
	Whitespace = { fg = colors.bg, bg = colors.none }, -- "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
	WinBar = { fg = colors.white, bg = colors.bg }, -- Window bar of current window. hl-WinBar
	WinBarNC = { fg = colors.fg, bg = colors.bg }, -- Window bar of not-current windows. hl-WinBarNC


	-- Diffs
	diffAdded = { fg = colors.darkgreen },
	diffRemoved = { fg = colors.darkred },
	diffChanged = { fg = colors.yellow },
	diffOldFile = { link = "diffRemoved" },
	diffNewFile = { link = "diffAdded" },
	diffFile = { fg = colors.darkred, style = "bold" },
	diffLine = { link = "diffFile" },
	diffIndexLine = { fg = colors.orange },

	-- Health
	healthError = { fg = colors.red },
	healthSuccess = { fg = colors.green },
	healthWarning = { fg = colors.yellow },
    }
    return editor
end

function theme.loadTerminal()
    vim.g.terminal_color_0 = colors.bg
    vim.g.terminal_color_1 = colors.fg
    vim.g.terminal_color_2 = colors.darkgreen
    vim.g.terminal_color_3 = colors.green
    vim.g.terminal_color_4 = colors.darkblue
    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_6 = colors.pink
    vim.g.terminal_color_7 = colors.lightgrey
    vim.g.terminal_color_8 = colors.heavyyellow
    vim.g.terminal_color_9 = colors.shinyblue
    vim.g.terminal_color_10 = colors.midblue
    vim.g.terminal_color_11 = colors.orange
    vim.g.terminal_color_12 = colors.red
    vim.g.terminal_color_13 = colors.darkred
    vim.g.terminal_color_14 = colors.orange
    vim.g.terminal_color_15 = colors.yellow
end

function theme.loadCursorTerminal()
    local cursorTerminal = {
	TermCursor = { bg = colors.white },
	TermCursorNC = { bg = colors.fg },
    }
    return cursorTerminal
end

function theme.loadTreeSitter()
    local treesitter = {
	TSAnnotation = { fg = colors.fg }, -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
	TSConstructor = { fg = colors.yellow }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
	TSConstant = { link = "Constant" }, -- For constants
	TSFloat = { link = "Float" }, -- For floats
	TSNumber = { link = "Number" }, -- For all number
	TSBoolean = { link = "Boolean" }, -- For booleans.

	TSAttribute = { fg = colors.fg }, -- (unstable) TODO: docs
	TSProperty = { fg = colors.fg },
	TSField = { link = "Field" },
	TSVariable = { link = "Variable" }, -- Any variable name that does not have another highlight.
	TSVariableBuiltin = { link = "Variable" },
	TSPreProc = { link = "PreProc" },
	TSConstBuiltin = { link = "Constant" }, -- For constant that are built in the language: `nil` in Lua.
	TSConstMacro = { link = "Constant" }, -- For constants that are defined by macros: `NULL` in C.
	TSError = { fg = colors.red, style = "underline" }, -- For syntax/parser errors.
	TSException = { link = "Exception" }, -- For exception related keywords.
	TSFunction = { fg = colors.yellow }, -- For function (calls and definitions)
	TSFunctionCall = { link = 'TSFunction' },
	TSFuncBuiltin = { link = 'TSFunction' },
	TSFuncMacro = { link = "TSFunction" }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
	TSInclude = { link = "Include" }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
	TSLabel = { link = "Label" }, -- For labels: `label:` in C and `:label:` in Lua.
	TSOperator = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in C.
	TSParameter = { fg = colors.shinyblue, style = "italic" }, -- For parameters of a function.
	TSParameterReference = { link = "TSParameter" }, -- For references to parameters of a function.
	TSPunctDelimiter = { link = "Delimiter" }, -- For delimiters ie: `.`
	TSPunctBracket = { fg = colors.fg }, -- For brackets and parens.
	TSPunctSpecial = { fg = colors.midblue }, -- For special punctutation that does not fall in the catagories before.
	TSSymbol = { fg = colors.pink }, -- For identifiers referring to symbols or atoms.
	TSType = { fg = colors.yellow }, -- For types.
	TSTypeBuiltin = { link = "TSType" }, -- For builtin types.
	TSTag = { link = "Tag" }, -- Tags like html tag names.
	TSTagDelimiter = { fg = colors.fg }, -- Tag delimiter like `<` `>` `/`
	TSText = { fg = colors.fg }, -- For strings considecolors11_gui text in a markup language.
	TSTextReference = { link = "TSText" }, -- FIXME
	TSEmphasis = { fg = colors.heavyyellow, style = "bold,underline" }, -- For text to be represented with emphasis.
	TSUnderline = { fg = colors.darkgreen, bg = colors.none, style = "underline" }, -- For text to be represented with an underline.
	TSTitle = { link = "Title" }, -- Text that is part of a title.
	TSLiteral = { fg = colors.fg }, -- Literal text.
	TSURI = { fg = colors.heavyyellow, style = "underline" }, -- Any URI like a link or email.
	TSAnnotation = { fg = colors.fg }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    }
    return treesitter
end

function theme.loadLSP()
    local lsp = {
	LspDiagnosticsDefaultError = { fg = colors.red }, -- used for "Error" diagnostic virtual text
	LspDiagnosticsSignError = { fg = colors.red }, -- used for "Error" diagnostic signs in sign column
	LspDiagnosticsFloatingError = { fg = colors.red }, -- used for "Error" diagnostic messages in the diagnostics float
	LspDiagnosticsVirtualTextError = { fg = colors.red }, -- Virtual text "Error"
	LspDiagnosticsUnderlineError = { style = "undercurl", sp = colors.red }, -- used to underline "Error" diagnostics.
	LspDiagnosticsDefaultWarning = { fg = colors.heavyyellow }, -- used for "Warning" diagnostic signs in sign column
	LspDiagnosticsSignWarning = { fg = colors.heavyyellow }, -- used for "Warning" diagnostic signs in sign column
	LspDiagnosticsFloatingWarning = { fg = colors.heavyyellow }, -- used for "Warning" diagnostic messages in the diagnostics float
	LspDiagnosticsVirtualTextWarning = { fg = colors.heavyyellow }, -- Virtual text "Warning"
	LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = colors.heavyyellow }, -- used to underline "Warning" diagnostics.
	LspDiagnosticsDefaultInformation = { fg = colors.shinyblue }, -- used for "Information" diagnostic virtual text
	LspDiagnosticsSignInformation = { fg = colors.shinyblue }, -- used for "Information" diagnostic signs in sign column
	LspDiagnosticsFloatingInformation = { fg = colors.shinyblue }, -- used for "Information" diagnostic messages in the diagnostics float
	LspDiagnosticsVirtualTextInformation = { fg = colors.shinyblue }, -- Virtual text "Information"
	LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = colors.shinyblue }, -- used to underline "Information" diagnostics.
	LspDiagnosticsDefaultHint = { fg = colors.white }, -- used for "Hint" diagnostic virtual text
	LspDiagnosticsSignHint = { fg = colors.white }, -- used for "Hint" diagnostic signs in sign column
	LspDiagnosticsFloatingHint = { fg = colors.white }, -- used for "Hint" diagnostic messages in the diagnostics float
	LspDiagnosticsVirtualTextHint = { fg = colors.white }, -- Virtual text "Hint"
	LspDiagnosticsUnderlineHint = { style = "undercurl", sp = colors.white }, -- used to underline "Hint" diagnostics.
	LspReferenceText = { fg = colors.fg, bg = colors.bg }, -- used for highlighting "text" references
	LspReferenceRead = { fg = colors.fg, bg = colors.bg }, -- used for highlighting "read" references
	LspReferenceWrite = { fg = colors.fg, bg = colors.bg }, -- used for highlighting "write" references

	DiagnosticError = { link = "LspDiagnosticsDefaultError" },
	DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
	DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
	DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
	DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
	DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
	DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
	DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
	DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
	DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
	DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
	DiagnosticSignError = { link = "LspDiagnosticsSignError" },
	DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
	DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
	DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
	DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
	DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
	DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
	DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
	DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
    }
    return lsp
end

function theme.loadPlugins()
    local plugins = {
	-- Telescope
	TelescopeNormal = { fg = colors.fg }, -- text color
	TelescopePrompt = { link = "TelescopeNormal" }, -- text color
	TelescopePromptBorder = { fg = colors.fg }, -- prompt section
	TelescopeResultsBorder = { link = "TelescopePromptBorder" }, -- results section
	TelescopePreviewBorder = { link = "TelescopePromptBorder" }, -- preview section
	TelescopeSelectionCaret = { fg = colors.white }, -- arrow selector
	TelescopePromptPrefix = { link = "TelescopeSelectionCaret" }, -- arrow in file browser's search field
	TelescopeSelection = { link = "TelescopeSelectionCaret" }, -- selection text color
	TelescopeMultiSelection = { link = "TelescopeSelectionCaret" },
	TelescopeMatching = { fg = colors.yellow }, -- text matching
	TelescopePromptCounter = { fg = colors.fg },
	TelescopePreviewHyphen = { link = "TelescopePromptCounter" },

	-- nvim-cmp
	CmpItemKind = { fg = colors.heavyyellow },
	CmpItemAbbrMatch = { fg = colors.yellow, style = "bold" },
	CmpItemAbbrMatchFuzzy = { fg = colors.lightgrey, style = "bold" },
	CmpItemAbbr = { fg = colors.lighgrey },
	CmpItemMenu = { fg = colors.heavyyellow },
	CmpItemKindText = { fg = colors.darkgreen },
	CmpItemKindMethod = { fg = colors.yellow },
	CmpItemKindFunction = { link = "CmpItemKindMethod" },
	CmpItemKindConstructor = { link = "CmpItemKindMethod" },
	CmpItemKindField = { fg = colors.fg },
	CmpItemKindVariable = { link = "CmpItemKindField" },
	CmpItemKindClass = { fg = colors.heavyyellow },
	CmpItemKindInterface = { link = "CmpItemKindClass" },
	CmpItemKindModule = { link = "CmpItemKindField" },
	CmpItemKindProperty = { fg = colors.shinyblue },
	CmpItemKindUnit = { link = "CmpItemKindField" },
	CmpItemKindValue = { link = "CmpItemKindText" },
	CmpItemKindEnum = { link = "CmpItemKindField" },
	CmpItemKindKeyword = { link = "CmpItemKindField" },
	CmpItemKindSnippet = { fg = colors.orange },
	CmpItemKindColor = { link = "CmpItemKindProperty" },
	CmpItemKindFile = { fg = colors.red },
	CmpItemKindReference = { link = "CmpItemKindMethod" },
	CmpItemKindFolder = { fg = colors.darkred },
	CmpItemKindEnumMember = { link = "CmpItemKindField" },
	CmpItemKindConstant = { fg = colors.purple },
	CmpItemKindStruct = { link = "CmpItemKindClass" },
	CmpItemKindEvent = { link = "CmpItemKindMethod" },
	CmpItemKindOperator = { fg = colors.pink },
	CmpItemKindTypeParameter = { link = "CmpItemKindProperty" },

	-- Git Signs
	GitSignsAddLn = { fg = colors.darkgreen },
	GitSignsAddNr = { fg = colors.darkgreen },
	GitSignsChangeLn = { fg = colors.yellow },
	GitSignsChangeNr = { fg = colors.yellow },
	GitSignsDeleteLn = { fg = colors.darkred },
	GitSignsDeleteNr = { fg = colors.darkred },
	GitSignsCurrentLineBlame = { fg = colors.orange, style = "bold" },

	-- Git gutter
	GitGutterAdd = { fg = colors.green },
	GitGutterChange = { fg = colors.yellow },
	GitGutterDelete = { fg = colors.red },
	GitGutterChangeDelete = { fg = colors.red },

	-- Lspsaga
	DiagnosticError = { fg = colors.red },
	DiagnosticWarning = { fg = colors.yellow },
	DiagnosticInformation = { fg = colors.shinyblue },
	DiagnosticHint = { fg = colors.white },
	DiagnosticTruncateLine = { fg = colors.fg },
	LspFloatWinNormal = { bg = colors.bg },
	LspFloatWinBorder = { fg = colors.fg },
	LspSagaBorderTitle = { fg = colors.yellow },
	LspSagaHoverBorder = { fg = colors.yellow },
	LspSagaRenameBorder = { fg = colors.orange },
	LspSagaDefPreviewBorder = { fg = colors.yellow },
	LspSagaCodeActionBorder = { fg = colors.red },
	LspSagaFinderSelection = { fg = colors.heavyyellow },
	LspSagaCodeActionTitle = { fg = colors.yellow },
	LspSagaCodeActionContent = { fg = colors.fg },
	LspSagaSignatureHelpBorder = { fg = colors.orange },
	ReferencesCount = { fg = colors.white },
	DefinitionCount = { fg = colors.fg },
	DefinitionIcon = { fg = colors.shinyblue },
	ReferencesIcon = { fg = colors.yellow },
	TargetWord = { fg = colors.red },

	-- NvimTree
	NvimTreeRootFolder = { fg = colors.heavyyellow, style = "bold" },
	NvimTreeGitDirty = { fg = colors.orange },
	NvimTreeGitNew = { fg = colors.green },
	NvimTreeImageFile = { fg = colors.pink },
	NvimTreeExecFile = { fg = colors.fg },
	NvimTreeSpecialFile = { fg = colors.yellow, style = "underline" },
	NvimTreeFolderName = { fg = colors.fg },
	NvimTreeEmptyFolderName = { fg = colors.fg },
	NvimTreeFolderIcon = { fg = colors.shinyblue },
	NvimTreeIndentMarker = { fg = colors.white },
	LspDiagnosticsError = { fg = colors.red },
	LspDiagnosticsWarning = { fg = colors.yellow },
	LspDiagnosticsInformation = { fg = colors.shinyblue },
	LspDiagnosticsHint = { fg = colors.white },

	-- Packer
	packerString = { fg = colors.darkgreen, bg = colors.none },
	packerHash = { fg = colors.yellow, bg = colors.none, style = "bold" },
	packerRelDate = { fg = colors.lightgrey, style = "bold,underline" },
	packerSuccess = { fg = colors.green, bg = colors.none, style = "bold" },
	packerStatusSuccess = { link = "PackerSuccess" },

	-- Indent Blankline
	IndentBlanklineChar = { fg = colors.lowgrey },
	IndentBlanklineContextChar = { fg = colors.shinyblue },

	-- Neo-tree
	NeoTreeRootName = { fg = colors.fg, style = "bold" },

	-- Notify
	NotifyERROR = { fg = colors.red },
	NotifyWARN = { fg = colors.yellow },
	NotifyINFO = { fg = colors.fg },
	NotifyDEBUG = { fg = colors.midblue },
	NotifyTRACE = { fg = colors.lightgrey },
	NotifyERRORTitle = { fg = colors.red },
	NotifyWARNTitle = { fg = colors.yellow },
	NotifyINFOTitle = { fg = colors.fg },
	NotifyDEBUGTitle = { fg = colors.midblue },
	NotifyTRACETitle = { fg = colors.lightgrey },

	-- Dashboard
	DashboardShortCut = { fg = colors.orange },
	DashboardHeader = { fg = colors.darkgreen },
	DashboardCenter = { fg = colors.heavyyellow },
	DashboardFooter = { fg = colors.fg, style = "italic" },
    }
    return plugins
end

return theme
-- Full documentation: https://neovim.io/doc/user/syntax.html#highlight-groups
