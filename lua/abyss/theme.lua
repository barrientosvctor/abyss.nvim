local api = require("abyss.lib.api")
local M = {}

-- All syntax groups: https://neovim.io/doc/user/syntax.html#group-name
-- All highlight groups: https://neovim.io/doc/user/syntax.html#highlight-groups
-- Documentation about `vim.api.nvim_set_hl()` function: https://neovim.io/doc/user/api.html#nvim_set_hl()
-- All treesitter captures: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
-- All treesitter captures linked by default to standard group names: https://neovim.io/doc/user/treesitter.html#treesitter-highlight

---Applies colors to colorscheme highlight groups.
---@param user_opts AbyssOptions
---@param spec Spec
function M.get(user_opts, spec)
  local none = "NONE"
  local groups = {
    -- Syntax --
    Comment = { fg = spec.syntax.comment, italic = user_opts.italic_comments },

    Constant = { fg = spec.syntax.constant },
    String = { fg = spec.syntax.string, italic = user_opts.italic },
    Character = { link = "String" },
    Number = { fg = spec.syntax.number },
    Boolean = { fg = spec.syntax.number, italic = user_opts.italic, bold = user_opts.bold },
    Float = { link = "Number" },

    Identifier = { fg = spec.syntax.identifier },
    Function = { fg = spec.syntax.func, bold = user_opts.bold, italic = user_opts.italic },

    Statement = { fg = spec.syntax.statement },
    Operator = { link = "Statement" },
    
    PreProc = { link = "Statement" },

    Type = { fg = spec.syntax.type, italic = true },
    StorageClass = { link = "Statement" }, -- Volatile keywords
    -- Structure = { fg = spec.syntax.structure, sp = spec.syntax.structure, underline = true },

    Special = { fg = spec.syntax.special },
    SpecialChar = { link = "Special" },
    Delimiter = { fg = spec.syntax.bracket },
    SpecialComment = { link = "Special" },
    Debug = { link = "Special" },

    Underlined = { underline = true },

    Error = { fg = spec.diagnostics.error, sp = spec.diagnostics.error, bold = true, underline = true },

    Todo = { fg = spec.diagnostics.hint, bg = spec.base.bg1, bold = true },

    markdownURL = { fg = spec.syntax.string, sp = spec.syntax.string, underline = true },
    markdownCodeBlock = { fg = spec.syntax.special, italic = user_opts.italic },

    -- Editor --
    ColorColumn = { bg = spec.base.fg1 },

    Conceal = { fg = spec.base.fg0, bg = none },

    Cursor = { fg = spec.base.bg0, bg = spec.editor.cursor },
    lCursor = { fg = spec.base.bg0, bg = spec.editor.cursor },
    CursorIM = { fg = spec.base.bg0, bg = spec.editor.cursor },
    CursorLine = { fg = none, bg = spec.editor.cursorline },
    CursorLineNr = { fg = spec.base.fg01, bg = spec.editor.cursorline },
    CursorColumn = { link = "CursorLine" },

    Directory = { fg = spec.syntax.special, bold = true },

    DiffAdd = { bg = spec.diff.bg.added },
    DiffChange = { bg = spec.diff.bg.changed },
    DiffDelete = { bg = spec.diff.bg.deleted },
    DiffText = { bg = spec.diff.bg.text },
    
    -- Neovim v0.10 diff highlights
    Added = { fg = spec.diff.added },
    Changed = { fg = spec.diff.changed },
    Removed = { fg = spec.diff.deleted },

    diffAdded = { link = "Added" },
    diffRemoved = { link = "Removed" },
    diffChanged = { link = "Changed" },
    diffFile = { link = "Type" },
    diffOldFile = { link = "diffFile" },
    diffNewFile = { link = "diffFile" },
    diffLine = { link = "Statement" },

    healthError = { fg = spec.diagnostics.error },
    healthSuccess = { fg = spec.diagnostics.ok },
    healthWarning = { fg = spec.diagnostics.warn },

    NonText = { fg = spec.editor.nontext },
    EndOfBuffer = { link = "NonText" },

    WinSeparator = { fg = spec.editor.border },
    VertSplit = { link = "WinSeparator" },

    OkMsg = { fg = spec.diagnostics.ok },
    ErrorMsg = { fg = spec.diagnostics.error },
    WarningMsg = { fg = spec.diagnostics.warn },

    Folded = { link = "Comment" },
    SignColumn = { fg = spec.base.fg0 },
    FoldColumn = { link = "SignColumn" },

    Search = { bg = spec.editor.match, fg = spec.base.fg0 },
    CurSearch = { bg = spec.editor.match_selected, fg = spec.base.fg0 },
    IncSearch = { link = "CurSearch" },
    Substitute = { link = "Search" },

    LineNr = { fg = spec.editor.linenr },

    MatchParen = { bg = spec.editor.cursor_selection },

    ModeMsg = { fg = spec.diagnostics.hint },
    MoreMsg = { fg = spec.diagnostics.info, bold = true },

    Normal = { fg = spec.base.fg0, bg = user_opts.transparent_background and none or spec.base.bg0 },
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = spec.base.fg0, bg = spec.base.bg1 },
    FloatBorder = { fg = spec.editor.border, bg = spec.base.bg1 },
    FloatTitle = { fg = spec.editor.title, bg = spec.base.bg1, bold = true },
    FloatFooter = { link = "FloatTitle" },

    Pmenu = { fg = spec.base.fg0, bg = spec.base.bg00 },
    PmenuSbar = { bg = spec.base.bg00 },
    PmenuSel = { fg = spec.base.fg01, bg = spec.base.bg01 },
    PmenuThumb = { bg = spec.base.bg01 },
    PmenuExtra = { fg = spec.syntax.comment, italic = true },
    PmenuExtraSel = { fg = spec.syntax.comment, bg = spec.base.bg01, italic = true },
    PmenuKind = { fg = spec.syntax.comment },
    PmenuKindSel = { fg = spec.syntax.comment, bg = spec.base.bg01 },
    PmenuBorder = { fg = spec.editor.border },
    PmenuMatch = { link = "Special" },
    PmenuMatchSel = { link = "Special" },

    Question = { link = "MoreMsg" },

    QuickFixLine = { link = "CursorLine" },

    SpecialKey = { link = "NonText" },

    SpellBad = { sp = spec.diagnostics.error, undercurl = true },
    SpellRare = { sp = spec.diagnostics.warn, undercurl = true },
    SpellCap = { sp = spec.diagnostics.warn, undercurl = true },
    SpellLocal = { sp = spec.diagnostics.ok, undercurl = true },

    StatusLine = { bg = spec.base.bg1 },
    StatusLineTerm = { link = "StatusLine" },
    StatusLineNC = { bg = spec.base.bg2, fg = spec.base.fg2 },
    StatusLineTermNC = { link = "StatusLineNC" },

    TabLine = { fg = spec.base.fg1, bg = spec.base.bg0 },
    TabLineFill = { fg = none, bg = spec.base.bg0 },
    TabLineSel = { fg = spec.base.fg01, bg = spec.base.bg01, bold = true },

    Title = { fg = spec.editor.title, bold = true },

    Visual = { fg = none, bg = spec.editor.cursor_selection },
    VisualNOS = { link = "Visual" },

    Whitespace = { link = "NonText" },

    WildMenu = { link = "PmenuSel" },

    WinBar = { link = "Title" },
    WinBarNC = { link = "NormalNC" },

    TermCursor = { link = "Cursor" },
    TermCursorNC = { fg = spec.base.fg2, bg = spec.base.bg2 },

    -- Vim/Neovim syntax --
    htmlTag = { link = "Delimiter" },
    htmlEndTag = { link = "Delimiter" },
    htmlArg = { link = "Function" },

    -- Vim-compatible plugins --
    -- git gutter
    GitGutterAdd = { fg = spec.diff.added },
    GitGutterChange = { fg = spec.diff.changed },
    GitGutterDelete = { fg = spec.diff.deleted },
  }

  if api.is_nvim then
    -- LSP --
    groups.DiagnosticError = { fg = spec.diagnostics.error }
    groups.DiagnosticWarn = { fg = spec.diagnostics.warn }
    groups.DiagnosticInfo = { fg = spec.diagnostics.info }
    groups.DiagnosticHint = { fg = spec.diagnostics.hint }
    groups.DiagnosticOk = { fg = spec.diagnostics.ok }

    groups.DiagnosticUnderlineError = { sp = spec.diagnostics.error, undercurl = true }
    groups.DiagnosticUnderlineWarn = { sp = spec.diagnostics.warn, undercurl = true }
    groups.DiagnosticUnderlineInfo = { sp = spec.diagnostics.info, underline = true }
    groups.DiagnosticUnderlineHint = { sp = spec.diagnostics.hint, underline = true }
    groups.DiagnosticUnderlineOk = { sp = spec.diagnostics.ok, underline = true }

    groups.LspDiagnosticsError = { link = "DiagnosticError" }
    groups.LspDiagnosticsWarning = { link = "DiagnosticWarn" }
    groups.LspDiagnosticsInformation = { link = "DiagnosticInfo" }
    groups.LspDiagnosticsHint = { link = "DiagnosticHint" }

    groups.LspInlayHint = { fg = spec.syntax.comment, bg = spec.base.bg1 }

    -- Neovim-compatible plugins --
    -- Telescope
    groups.TelescopeTitle = { link = "Title" }

    groups.TelescopeBorder = { fg = spec.editor.border }

    groups.TelescopePromptPrefix = { fg = spec.editor.title }

    -- nvim-cmp
    groups.CmpItemAbbr = { fg = spec.base.fg0 }
    groups.CmpItemAbbrDeprecated = { fg = spec.syntax.comment, strikethrough = true }
    
    groups.CmpItemMenu = { fg = spec.syntax.comment }
    
    groups.CmpItemAbbrMatch = { link = "PmenuMatch" }
    groups.CmpItemAbbrMatchFuzzy = { link = "PmenuMatch" }

    groups.CmpItemKindText = { fg = spec.syntax.string }
    groups.CmpItemKindFunction = { fg = spec.syntax.func }
    groups.CmpItemKindMethod = { link = "CmpItemKindFunction" }
    groups.CmpItemKindClass = { fg = spec.syntax.structure }
    groups.CmpItemKindConstructor = { link = "CmpItemKindClass" }
    groups.CmpItemKindVariable = { fg = spec.syntax.identifier }
    groups.CmpItemKindField = { link = "CmpItemKindVariable" }
    groups.CmpItemKindInterface = { fg = spec.syntax.structure } -- possible change....
    groups.CmpItemKindModule = { fg = spec.syntax.structure } -- possible change....
    groups.CmpItemKindProperty = { fg = spec.syntax.identifier } -- possible change....
    groups.CmpItemKindUnit = { fg = spec.syntax.number }
    groups.CmpItemKindValue = { fg = spec.syntax.constant } -- possible change....
    groups.CmpItemKindEnum = { link = "CmpItemKindValue" }
    groups.CmpItemKindKeyword = { fg = spec.syntax.statement }
    groups.CmpItemKindSnippet = { fg = spec.syntax.special }
    groups.CmpItemKindColor = { fg = spec.syntax.special }
    groups.CmpItemKindFile = { fg = spec.syntax.special }
    groups.CmpItemKindReference = { fg = spec.syntax.identifier }
    groups.CmpItemKindFolder = { fg = spec.syntax.special }
    groups.CmpItemKindEnumMember = { link = "CmpItemKindValue" }
    groups.CmpItemKindConstant = { fg = spec.syntax.constant }
    groups.CmpItemKindStruct = { fg = spec.syntax.structure }
    groups.CmpItemKindEvent = { fg = spec.syntax.special }
    groups.CmpItemKindOperator = { fg = spec.syntax.statement }
    groups.CmpItemKindTypeParameter = { fg = spec.syntax.parameter }

    -- gitsigns
    groups.GitSignsCurrentLineBlame = { link = "Comment" }

    -- lspsaga
    groups.LspFloatWinNormal = { bg = spec.base.bg0 }
    groups.LspFloatWinBorder = { fg = spec.base.fg0 }
    groups.LspSagaBorderTitle = { link = "Title" }
    groups.LspSagaHoverBorder = { fg = spec.diagnostics.info }
    groups.LspSagaRenameBorder = { fg = spec.diagnostics.warn }
    groups.LspSagaDefPreviewBorder = { fg = spec.diagnostics.info }
    groups.LspSagaCodeActionBorder = { fg = spec.diagnostics.hint }
    groups.LspSagaFinderSelection = { fg = spec.diagnostics.info }
    groups.LspSagaCodeActionTitle = { link = "Title" }
    groups.LspSagaCodeActionContent = { fg = spec.base.fg0 }
    groups.LspSagaSignatureHelpBorder = { fg = spec.diagnostics.info }
    groups.ReferencesCount = { fg = spec.base.fg0 }
    groups.DefinitionCount = { fg = spec.base.fg0 }
    groups.DefinitionIcon = { fg = spec.diagnostics.info }
    groups.ReferencesIcon = { fg = spec.diagnostics.warn }
    groups.TargetWord = { fg = spec.editor.match }

    -- nvim-tree
    groups.NvimTreeGitNew = { link = "DiffAdd" }
    groups.NvimTreeGitDeletedIcon = { link = "DiffDelete" }
    groups.NvimTreeGitRenamedIcon = { link = "DiffChange" }
    groups.NvimTreeGitStagedIcon = { link = "diffFile" }
    groups.NvimTreeGitMergeIcon = { link = "diffFile" }
    groups.NvimTreeIndentMarker = { link = "NonText" }

    -- indent blankline
    groups.IndentBlanklineChar = { link = "NonText" }
    groups.IndentBlanklineContextChar = { fg = spec.base.fg01 }
    groups["@ibl.indent.char.1"] = { link = "String" }
    groups["@ibl.scope.char.1"] = { fg = spec.base.fg01 }
    groups["@ibl.scope.underline.1"] = { link = "@ibl.scope.char.1" }

    -- neo-tree
    groups.NeoTreeRootName = { fg = spec.dirtree.rootname }
    groups.NeoTreeDirectoryName = { fg = spec.dirtree.dirname }
    groups.NeoTreeDirectoryIcon = { fg = spec.dirtree.dirname }
    groups.NeoTreeGitUntracked = { fg = spec.diff.untracked, italic = true }
    groups.NeoTreeCursorLine = { fg = spec.dirtree.curline, bg = none, sp = spec.dirtree.curline, underline = true }

    -- notify
    groups.NotifyERROR = { fg = spec.diagnostics.error }
    groups.NotifyWARN = { fg = spec.diagnostics.warn }
    groups.NotifyINFO = { fg = spec.diagnostics.info }
    groups.NotifyDEBUG = { fg = spec.diagnostics.hint }
    groups.NotifyTRACE = { link = "NotifyINFO" }
    groups.NotifyERRORTitle = { link = "NotifyERROR" }
    groups.NotifyWARNTitle = { link = "NotifyWARN" }
    groups.NotifyINFOTitle = { link = "NotifyINFO" }
    groups.NotifyDEBUGTitle = { link = "NotifyDEBUG" }
    groups.NotifyTRACETitle = { link = "NotifyTRACE" }

    -- dashboard
    groups.DashboardShortCut = { link = "Comment" }
    groups.DashboardHeader = { link = "Title" }
    groups.DashboardCenter = { link = "Special" }
    groups.DashboardFooter = { link = "Comment" }

    -- aerial
    groups.AerialLine = { fg = spec.dirtree.curline, bg = none, sp = spec.dirtree.curline, underline = true }
  end

  return groups
end

---Treesitter highlights.
---@param spec Spec
---@return table
function M.get_treesitter(spec)
  return {
    -- Treesitter --
    -- Semantic tokens
    ["@lsp.type.class"] = { link = "Structure" },
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.enum"] = { link = "Structure" },
    ["@lsp.type.enumMember"] = { link = "Constant" },
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { link = "Structure" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.namespace"] = { link = "Structure" },
    ["@lsp.type.parameter"] = { fg = spec.syntax.parameter, italic = true },
    ["@lsp.type.property"] = { link = "Constant" },
    ["@lsp.type.struct"] = { link = "Structure" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { link = "Type" },
    ["@lsp.type.variable"] = { link = "Constant" },

    -- Misc
    ["@comment"] = { link = "@lsp.type.comment" },
    ["@error"] = { link = "Error" },
    ["@operator"] = { link = "Operator" },

    -- Punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { fg = spec.syntax.bracket },
    ["@punctuation.special"] = { link = "SpecialChar" },

    ["@constructor"] = { link = "@lsp.type.class" },
    ["@field"] = { link = "@lsp.type.property" },
    ["@variable"] = { link = "@lsp.type.variable" },
    ["@variable.builtin"] = { link = "@lsp.type.variable" },
    ["@property"] = { link = "@lsp.type.property" },
    ["@parameter"] = { link = "@lsp.type.parameter" },
    ["@variable.parameter"] = { link = "@lsp.type.parameter" },
    ["@function"] = { link = "@lsp.type.function" },
    ["@function.call"] = { link = "@lsp.type.function" },
    ["@function.builtin"] = { link = "@lsp.type.function" },
    ["@function.macro"] = { link = "@lsp.type.function" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Constant" },
    ["@constant.macro"] = { link = "Constant" },
    ["@parameter.reference"] = { link = "@lsp.type.parameter" },
    ["@exception"] = { link = "Exception" },
    ["@type.builtin"] = { link = "@lsp.type.type" },

    -- Typescript
    ["@constant.builtin.typescript"] = { link = "Boolean" },

    ["@preproc"] = { link = "PreProc" },
    ["@include"] = { link = "PreProc" },

    ["@repeat"] = { link = "Statement" },
    ["@conditional"] = { link = "Statement" },
    ["@type.qualifier"] = { link = "Statement" },

    -- HTML
    ["@tag"] = { link = "Statement" },
    ["@tag.builtin"] = { link = "@tag" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@tag.attribute"] = { link = "Function" },
  }
end

---Load the terminal colors.
---@param spec Spec
function M.load_terminal_colors(spec)
  vim.g.terminal_color_0 = spec.terminal.color0
  vim.g.terminal_color_1 = spec.terminal.color1
  vim.g.terminal_color_2 = spec.terminal.color2
  vim.g.terminal_color_3 = spec.terminal.color3
  vim.g.terminal_color_4 = spec.terminal.color4
  vim.g.terminal_color_5 = spec.terminal.color5
  vim.g.terminal_color_6 = spec.terminal.color6
  vim.g.terminal_color_7 = spec.terminal.color7
  vim.g.terminal_color_8 = spec.terminal.color8
  vim.g.terminal_color_9 = spec.terminal.color9
  vim.g.terminal_color_10 = spec.terminal.color10
  vim.g.terminal_color_11 = spec.terminal.color11
  vim.g.terminal_color_12 = spec.terminal.color12
  vim.g.terminal_color_13 = spec.terminal.color13
  vim.g.terminal_color_14 = spec.terminal.color14
  vim.g.terminal_color_15 = spec.terminal.color15
end

return M
