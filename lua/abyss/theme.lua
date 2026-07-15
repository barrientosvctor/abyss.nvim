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
    Label = { link = "Statement" },
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
    groups.DiagnosticUnnecessary = { fg = spec.syntax.comment, undercurl = true, sp = spec.syntax.comment, italic = true }

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
    groups.NvimTreeSpecialFile = { fg = spec.syntax.special, underline = true, sp = spec.syntax.special }
    groups.NvimTreeIndentMarker = { fg = spec.syntax.comment }

    groups.NvimTreeGitDeletedIcon = { fg = spec.diff.deleted }
    groups.NvimTreeGitNewIcon = { fg = spec.diff.added }
    groups.NvimTreeGitRenamedIcon = { fg = spec.diff.changed }
    groups.NvimTreeGitStagedIcon = { fg = spec.diff.added }
    groups.NvimTreeGitDirtyIcon = { fg = spec.diff.untracked }

    groups.NvimTreeGitNew = { link = "NvimTreeGitNewIcon" }

    -- indent blankline
    groups.IndentBlanklineChar = { link = "NonText" }
    groups.IndentBlanklineContextChar = { fg = spec.base.fg01 }
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

    groups.NotifyERRORTitle = { fg = spec.diagnostics.error, bold = true }
    groups.NotifyERRORBorder = { fg = spec.diagnostics.error }
    groups.NotifyERRORIcon = { fg = spec.diagnostics.error }

    groups.NotifyWARNTitle = { fg = spec.diagnostics.warn, bold = true }
    groups.NotifyWARNBorder = { fg = spec.diagnostics.warn }
    groups.NotifyWARNIcon = { fg = spec.diagnostics.warn }

    groups.NotifyINFOTitle = { fg = spec.diagnostics.info, bold = true }
    groups.NotifyINFOBorder = { fg = spec.diagnostics.info }
    groups.NotifyINFOIcon = { fg = spec.diagnostics.info }

    groups.NotifyDEBUGTitle = { fg = spec.diagnostics.hint, bold = true }
    groups.NotifyDEBUGBorder = { fg = spec.diagnostics.hint }
    groups.NotifyDEBUGIcon = { fg = spec.diagnostics.hint }

    groups.NotifyTRACETitle = { fg = spec.diagnostics.info, bold = true }
    groups.NotifyTRACEBorder = { fg = spec.diagnostics.info }
    groups.NotifyTRACEIcon = { fg = spec.diagnostics.info }

    -- dashboard
    groups.DashboardShortCut = { link = "Comment" }
    groups.DashboardFooter = { link = "Comment" }

    groups.DashboardHeader = { link = "Title" }
    
    groups.DashboardProjectTitle = { link = "Special" }
    groups.DashboardMruTitle = { link = "Special" }
    
    groups.DashboardProjectIcon = { link = "Special" }

    groups.DashboardKey = { link = "Special" }
    groups.DashboardIcon = { link = "Special" }

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
    -- Treesitter captures
    -- :help treesitter-highlight-groups
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { link = "@variable" },
    ["@variable.parameter"] = { fg = spec.syntax.parameter, italic = true },
    ["@variable.member"] = { link = "@variable" },
    
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "@constant" },
    ["@constant.macro"] = { link = "@constant" },

    ["@module"] = { fg = spec.syntax.structure, underline = true, sp = spec.syntax.structure },
    ["@module.builtin"] = { link = "@module" },
    ["@label"] = { link = "Label" },

    ["@string"] = { link = "String" },
    ["@string.documentation"] = { link = "@string" },
    ["@string.regexp"] = { link = "Constant" },
    ["@string.escape"] = { link = "Special" },
    ["@string.special"] = { link = "Special" },
    ["@string.special.symbol"] = { link = "@string.special" },
    ["@string.special.path"] = { link = "@string.special" },
    ["@string.special.url"] = { fg = spec.syntax.string, underline = true, sp = spec.syntax.string },

    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "Special" },

    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },

    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "@type" },
    ["@type.definition"] = { link = "@module" },

    ["@attribute"] = { link = "Function" },
    ["@attribute.builtin"] = { link = "@attribute" },
    ["@property"] = { link = "@variable" },

    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "@function" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "@function" },

    ["@function.method"] = { link = "@function" },
    ["@function.method.call"] = { link = "@function" },

    ["@constructor"] = { link = "Function" },
    ["@operator"] = { link = "Operator" },

    ["@keyword"] = { link = "Statement" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.function"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@keyword" },
    ["@keyword.import"] = { link = "@keyword" },
    ["@keyword.type"] = { link = "@type" }, -- or @keyword
    ["@keyword.modifier"] = { link = "@keyword" },
    ["@keyword.repeat"] = { link = "@keyword" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@keyword.debug"] = { link = "@keyword" },
    ["@keyword.exception"] = { link = "@keyword" },
    ["@keyword.conditional"] = { link = "@keyword" },
    ["@keyword.conditional.ternary"] = { link = "@keyword" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.directive.define"] = { link = "@keyword.directive" },

    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "@punctuation.delimiter" },
    ["@punctuation.special"] = { link = "Special" },

    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "@comment" },

    ["@comment.error"] = { link = "DiagnosticError" },
    ["@comment.warning"] = { link = "DiagnosticWarn" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "DiagnosticInfo" },

    ["@markup.quote"] = { link = "Comment" },
    ["@markup.math"] = { link = "Special" },

    ["@markup.link"] = { link = "@string.special.url" },
    ["@markup.link.label"] = { link = "Underlined" },
    ["@markup.link.url"] = { link = "@string.special.url" },

    ["@markup.raw"] = { fg = spec.base.fg0 },
    ["@markup.raw.block"] = { link = "@markup.raw" },

    ["@markup.list"] = { link = "Special" },
    ["@markup.list.checked"] = { link = "Special" },
    ["@markup.list.unchecked"] = { link = "Special" },
    
    ["@diff.plus"] = { link = "Added" },
    ["@diff.minus"] = { link = "Removed" },
    ["@diff.delta"] = { link = "Changed" },
    
    ["@tag"] = { link = "Statement" },
    ["@tag.builtin"] = { link = "@tag" },
    ["@tag.attribute"] = { link = "Function" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    
    -- Misc
    ["@error"] = { link = "Error" },
    ["@type.qualifier"] = { link = "Statement" },
    
    ["@preproc"] = { link = "PreProc" },
    ["@include"] = { link = "PreProc" },
    
    ["@repeat"] = { link = "Statement" },
    ["@conditional"] = { link = "Statement" },

    ["@field"] = { link = "@lsp.type.property" },
    ["@parameter"] = { link = "@variable.parameter" },
    ["@parameter.reference"] = { link = "@variable.parameter" },
    ["@exception"] = { link = "Exception" },

    -- LSP Semantic tokens
    -- :help lsp-semantic-highlight
    ["@lsp.type.class"] = { fg = spec.syntax.structure, underline = true, sp = spec.syntax.structure },
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.decorator"] = { link = "Function" },
    ["@lsp.type.enum"] = { link = "@lsp.type.class" },
    ["@lsp.type.enumMember"] = { fg = spec.syntax.identifier },
    ["@lsp.type.event"] = { link = "@lsp.type.class"},
    ["@lsp.type.function"] = { link = "Function" },
    ["@lsp.type.interface"] = { link = "@lsp.type.class" },
    ["@lsp.type.keyword"] = { link = "Statement" },
    ["@lsp.type.macro"] = { link = "Macro" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.modifier"] = { link = "Statement" },
    ["@lsp.type.namespace"] = { link = "@lsp.type.class" },
    ["@lsp.type.number"] = { link = "Number" },
    ["@lsp.type.operator"] = { link = "Operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "Identifier" },
    ["@lsp.type.regexp"] = { link = "@string.regexp" },
    ["@lsp.type.string"] = { link = "String" },
    ["@lsp.type.struct"] = { link = "@lsp.type.class" },
    ["@lsp.type.type"] = { link = "Type" },
    ["@lsp.type.typeParameter"] = { link = "Type" },
    ["@lsp.type.variable"] = { link = "@variable" },
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
