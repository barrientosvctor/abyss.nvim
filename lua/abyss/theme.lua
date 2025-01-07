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
  return {
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

    Statement = { fg = spec.syntax.statement, italic = user_opts.italic, bold = user_opts.bold },

    PreProc = { link = "Statement" },
    Operator = { fg = spec.syntax.statement },

    Type = { fg = spec.syntax.type, italic = true },
    StorageClass = { link = "Statement" }, -- Volatile keywords
    Structure = { fg = spec.syntax.structure, underline = true },

    Special = { fg = spec.syntax.special },
    SpecialChar = { link = "Special" },
    Delimiter = { fg = spec.syntax.bracket },
    SpecialComment = { link = "Special" },
    Debug = { link = "Special" },

    Underlined = { underline = true },

    Error = { fg = spec.diagnostics.error, bold = true, underline = true },

    Todo = { fg = spec.diagnostics.hint, bg = spec.base.bg1, bold = true },

    markdownURL = { fg = spec.syntax.string, underline = true },
    markdownCodeBlock = { fg = spec.syntax.special, italic = user_opts.italic },

    -- Editor --
    ColorColumn = { link = "CursorLine" },
    Conceal = { fg = spec.base.fg0, bg = none },

    Cursor = { fg = spec.base.bg0, bg = spec.editor.cursor },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    CursorLine = { fg = none, bg = spec.editor.cursorline },
    CursorLineNr = { fg = spec.base.fg01, bg = spec.editor.cursorline, bold = true },
    CursorColumn = { link = "CursorLine" },

    Directory = { link = "Function" },

    DiffAdd = { fg = spec.diff.added },
    DiffChange = { fg = spec.diff.changed },
    DiffDelete = { fg = spec.diff.deleted },
    DiffText = { fg = spec.diff.text },
    diffAdded = { link = "DiffAdd" },
    diffRemoved = { link = "DiffDelete" },
    diffChanged = { link = "DiffChange" },
    diffOldFile = { link = "DiffDelete" },
    diffNewFile = { link = "DiffAdd" },
    diffFile = { fg = spec.diff.text, bg = none, bold = true },
    diffLine = { link = "diffFile" },
    diffIndexLine = { link = "diffLine" },

    -- Neovim v0.10 diff highlights
    Added = { link = "DiffAdd" },
    Changed = { link = "DiffChange" },
    Removed = { link = "DiffDelete" },

    healthError = { fg = spec.diagnostics.error },
    healthSuccess = { fg = spec.diagnostics.ok },
    healthWarning = { fg = spec.diagnostics.warn },

    NonText = {
      fg = spec.editor.nontext,
    },
    EndOfBuffer = {
      fg = user_opts.transparent_background and none or spec.base.bg0,
      bg = user_opts.transparent_background and none or spec.base.bg0,
    },

    VertSplit = { fg = spec.base.fg0, bg = spec.base.bg0 },
    WinSeparator = { link = "VertSplit" },

    ErrorMsg = { fg = spec.diagnostics.error },
    WarningMsg = { fg = spec.diagnostics.warn },

    Folded = { link = "Comment" },
    FoldColumn = { link = "CursorColumn" },
    SignColumn = { fg = spec.base.fg0, bg = user_opts.transparent_background and none or spec.base.bg0 },

    CurSearch = { fg = spec.base.bg0, bg = spec.editor.match_selected, bold = true, underline = true },
    IncSearch = { link = "CurSearch" },
    Substitute = { link = "Search" },

    LineNr = { fg = spec.editor.linenr, bg = user_opts.transparent_background and none or spec.base.bg0 },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNrAbove" },

    MatchParen = { link = "CurSearch" },

    MsgArea = { fg = spec.diagnostics.info },
    ModeMsg = { link = "MsgArea" },
    MoreMsg = { fg = spec.diagnostics.info, bold = true },

    Normal = { fg = spec.base.fg0, bg = user_opts.transparent_background and none or spec.base.bg0 },
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = spec.base.fg0, bg = spec.base.bg1 },
    FloatBorder = { link = "NormalFloat" },

    Pmenu = { fg = spec.base.fg0, bg = spec.base.bg00 },
    PmenuSbar = { bg = spec.base.bg00 },
    PmenuSel = { fg = spec.base.fg01, bg = spec.base.bg01 },
    PmenuThumb = { bg = spec.base.bg01 },

    Question = { link = "MoreMsg" },

    QuickFixLine = { link = "CursorLine" },

    Search = { fg = spec.base.bg0, bg = spec.editor.match },
    SpecialKey = { link = "NonText" },

    SpellBad = { fg = spec.diagnostics.error, undercurl = true },
    SpellRare = { fg = spec.diagnostics.info, undercurl = true },
    SpellCap = { fg = spec.diagnostics.warn, undercurl = true },
    SpellLocal = { fg = spec.diagnostics.info, undercurl = true },

    StatusLine = { fg = none, bg = spec.base.bg1 },
    StatusLineTerm = { link = "StatusLine" },
    StatusLineNC = { fg = none, bg = spec.base.bg2 },
    StatusLineTermNC = { link = "StatusLineNC" },

    TabLine = { fg = spec.base.fg1, bg = spec.base.bg0 },
    TabLineFill = { fg = none, bg = spec.base.bg0 },
    TabLineSel = { fg = spec.base.fg01, bg = spec.base.bg01 },

    Title = { fg = spec.editor.title, bold = true },

    Visual = { fg = none, bg = spec.editor.cursor_selection },
    VisualNOS = { link = "Visual" },

    Whitespace = { link = "NonText" },

    WildMenu = { link = "PmenuSel" },

    WinBar = { link = "Title" },
    WinBarNC = { link = "NormalNC" },

    TermCursor = { link = "Cursor" },
    TermCursorNC = { fg = spec.base.fg2, bg = spec.base.bg2 },

    -- LSP --
    DiagnosticError = { fg = spec.diagnostics.error },
    DiagnosticWarn = { fg = spec.diagnostics.warn },
    DiagnosticInfo = { fg = spec.diagnostics.info },
    DiagnosticHint = { fg = spec.diagnostics.hint },
    DiagnosticOk = { fg = spec.diagnostics.ok },

    DiagnosticUnderlineError = { sp = spec.diagnostics.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = spec.diagnostics.warn, undercurl = true },
    DiagnosticUnderlineInfo = { sp = spec.diagnostics.info, underline = true },
    DiagnosticUnderlineHint = { sp = spec.diagnostics.hint, underline = true },

    LspDiagnosticsError = { link = "DiagnosticError" },
    LspDiagnosticsWarning = { link = "DiagnosticWarn" },
    LspDiagnosticsInformation = { link = "DiagnosticInfo" },
    LspDiagnosticsHint = { link = "DiagnosticHint" },

    LspSignatureActiveParameter = {
      fg = spec.base.fg01,
      bg = spec.base.bg01,
      italic = user_opts.italic,
      bold = user_opts.bold,
    },
    LspInlayHint = { link = "NonText" },

    -- Plugins --
    -- Telescope
    -- Sets the highlight for selected items within the picker.
    TelescopeSelection = { link = "Title" },
    TelescopeSelectionCaret = { link = "TelescopeSelection" },
    TelescopeMultiSelection = { link = "TelescopeSelection" },
    TelescopeMultiIcon = { link = "TelescopeSelectionCaret" },

    TelescopeTitle = { link = "Title" },

    TelescopeBorder = { fg = spec.base.fg1 },

    TelescopePrompt = { link = "TelescopeNormal" },
    TelescopePromptPrefix = { link = "TelescopeSelectionCaret" },
    TelescopeMatching = { fg = spec.editor.match },

    -- nvim-cmp
    CmpItemAbbrMatch = { fg = spec.editor.match, bold = true },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpItemAbbr = { fg = spec.base.fg0 },
    CmpItemMenu = { link = "Comment" },
    CmpItemKindText = { link = "String" },
    CmpItemKindMethod = { link = "Function" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindConstructor = { link = "Structure" },
    CmpItemKindField = { link = "Constant" },
    CmpItemKindVariable = { link = "Constant" },
    CmpItemKindClass = { link = "Structure" },
    CmpItemKindInterface = { link = "Structure" },
    CmpItemKindModule = { link = "Structure" },
    CmpItemKindProperty = { link = "Constant" },
    CmpItemKindUnit = { link = "Constant" },
    CmpItemKindValue = { link = "CmpItemKindText" },
    CmpItemKindEnum = { link = "Constant" },
    CmpItemKindKeyword = { link = "Statement" },
    CmpItemKindSnippet = { fg = spec.base.fg1 },
    CmpItemKindColor = { link = "CmpItemKindProperty" },
    CmpItemKindReference = { link = "CmpItemKindMethod" },
    CmpItemKindFolder = { link = "Structure" },
    CmpItemKindEnumMember = { link = "Constant" },
    CmpItemKindConstant = { link = "Constant" },
    CmpItemKindStruct = { link = "Structure" },
    CmpItemKindEvent = { link = "CmpItemKindMethod" },
    CmpItemKindOperator = { link = "Operator" },
    CmpItemKindTypeParameter = { fg = spec.syntax.parameter },

    -- gitsigns
    GitSignsAddLn = { link = "DiffAdd" },
    GitSignsAddNr = { link = "GitSignsAddLn" },
    GitSignsChangeLn = { link = "DiffChange" },
    GitSignsChangeNr = { link = "GitSignsChangeLn" },
    GitSignsDeleteLn = { link = "DiffChange" },
    GitSignsDeleteNr = { link = "GitSignsDeleteLn" },

    -- git gutter
    GitGutterAdd = { link = "DiffAdd" },
    GitGutterChange = { link = "DiffChange" },
    GitGutterDelete = { link = "DiffDelete" },
    GitGutterChangeDelete = { link = "GitGutterDelete" },

    -- lspsaga
    LspFloatWinNormal = { bg = spec.base.bg0 },
    LspFloatWinBorder = { fg = spec.base.fg0 },
    LspSagaBorderTitle = { link = "Title" },
    LspSagaHoverBorder = { fg = spec.diagnostics.info },
    LspSagaRenameBorder = { fg = spec.diagnostics.warn },
    LspSagaDefPreviewBorder = { fg = spec.diagnostics.info },
    LspSagaCodeActionBorder = { fg = spec.diagnostics.hint },
    LspSagaFinderSelection = { fg = spec.diagnostics.info },
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionContent = { fg = spec.base.fg0 },
    LspSagaSignatureHelpBorder = { fg = spec.diagnostics.info },
    ReferencesCount = { fg = spec.base.fg0 },
    DefinitionCount = { fg = spec.base.fg0 },
    DefinitionIcon = { fg = spec.diagnostics.info },
    ReferencesIcon = { fg = spec.diagnostics.warn },
    TargetWord = { fg = spec.editor.match },

    -- nvim-tree
    NvimTreeGitNew = { link = "DiffAdd" },
    NvimTreeGitDeletedIcon = { link = "DiffDelete" },
    NvimTreeGitRenamedIcon = { link = "DiffChange" },
    NvimTreeGitStagedIcon = { link = "diffFile" },
    NvimTreeGitMergeIcon = { link = "diffFile" },
    NvimTreeIndentMarker = { link = "NonText" },

    -- packer
    packerString = { link = "String" },
    packerHash = { link = "Special" },
    packerRelDate = { fg = spec.diagnostics.info, bold = true, underline = true },
    packerSuccess = { fg = spec.diagnostics.ok, bg = none, bold = true },
    packerStatusSuccess = { link = "PackerSuccess" },

    -- indent blankline
    IndentBlanklineChar = { link = "NonText" },
    IndentBlanklineContextChar = { fg = spec.base.fg01 },
    ["@ibl.indent.char.1"] = { link = "NonText" },
    ["@ibl.scope.char.1"] = { fg = spec.base.fg01 },
    ["@ibl.scope.underline.1"] = { link = "@ibl.scope.char.1" },

    -- neo-tree
    NeoTreeRootName = { fg = spec.dirtree.rootname },
    NeoTreeDirectoryName = { fg = spec.dirtree.dirname },
    NeoTreeDirectoryIcon = { fg = spec.dirtree.dirname },
    NeoTreeGitUntracked = { fg = spec.diff.untracked, italic = true },
    NeoTreeCursorLine = { fg = spec.dirtree.curline, bg = none, underline = true },

    -- notify
    NotifyERROR = { fg = spec.diagnostics.error },
    NotifyWARN = { fg = spec.diagnostics.warn },
    NotifyINFO = { fg = spec.diagnostics.info },
    NotifyDEBUG = { fg = spec.diagnostics.hint },
    NotifyTRACE = { link = "NotifyINFO" },
    NotifyERRORTitle = { link = "NotifyERROR" },
    NotifyWARNTitle = { link = "NotifyWARN" },
    NotifyINFOTitle = { link = "NotifyINFO" },
    NotifyDEBUGTitle = { link = "NotifyDEBUG" },
    NotifyTRACETitle = { link = "NotifyTRACE" },

    -- dashboard
    DashboardShortCut = { link = "Comment" },
    DashboardHeader = { link = "Title" },
    DashboardCenter = { link = "Special" },
    DashboardFooter = { link = "Comment" },

    htmlTag = { link = "Delimiter" },
    htmlEndTag = { link = "Delimiter" },
    htmlArg = { link = "Function" },

    -- aerial
    AerialLine = { fg = spec.dirtree.curline, bg = none, underline = true },
  }
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
