local M = {}
local colors = require("abyss.colors")

-- All syntax groups: https://neovim.io/doc/user/syntax.html#group-name
-- All highlight groups: https://neovim.io/doc/user/syntax.html#highlight-groups
-- Documentation about `vim.api.nvim_set_hl()` function: https://neovim.io/doc/user/api.html#nvim_set_hl()
-- All treesitter captures: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
-- All treesitter captures linked by default to standard group names: https://neovim.io/doc/user/treesitter.html#treesitter-highlight

---Applies colors to colorscheme highlight groups.
---@param user_opts AbyssOptions
function M.get(user_opts)
  return {
    -- Syntax --
    Comment = { fg = colors.midblue, italic = user_opts.italic_comments },

    Constant = { fg = colors.fg },
    String = { fg = colors.darkgreen, italic = user_opts.italic },
    Character = { link = "String" },
    Number = { fg = colors.pink },
    Boolean = { fg = colors.pink, italic = user_opts.italic, bold = user_opts.bold },
    Float = { link = "Number" },

    Identifier = { fg = colors.fg },
    Function = { fg = colors.yellow, bold = user_opts.bold, italic = user_opts.italic },

    Statement = { fg = colors.darkgrey, italic = user_opts.italic, bold = user_opts.bold },

    PreProc = { fg = colors.darkgrey },
    Operator = { fg = colors.darkgrey },

    Type = { fg = colors.purple, italic = true },
    StorageClass = { fg = colors.darkgrey },
    Structure = { fg = colors.heavyyellow, underline = true },

    Special = { fg = colors.yellow },
    SpecialChar = { fg = colors.pink },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.purple },
    Debug = { fg = colors.darkgrey },

    Underlined = { underline = true },

    Ignore = { fg = colors.darkgrey },

    Error = { fg = colors.red, bold = true, underline = true },

    Todo = { fg = colors.heavyyellow, bg = colors.darkred, bold = true },

    markdownURL = { fg = colors.darkgreen, underline = true },
    markdownCodeBlock = { fg = colors.yellow, italic = user_opts.italic },

    -- Editor --
    ColorColumn = { fg = colors.none, bg = colors.darkred },
    Conceal = { fg = colors.fg, bg = colors.none },

    Cursor = { fg = colors.midblue, bg = colors.darkred, reverse = true },
    lCursor = { link = "Cursor" },
    CursorIM = { fg = colors.lowgrey, bg = colors.darkred, reverse = true },
    CursorLine = { fg = colors.none, bg = colors.darkblue },
    CursorLineNr = { fg = colors.lightgrey, bg = colors.bg },
    CursorColumn = { link = "CursorLine" },

    Directory = { fg = colors.heavyyellow, bg = colors.none },

    DiffAdd = { fg = colors.darkgreen },
    DiffChange = { fg = colors.yellow },
    DiffDelete = { fg = colors.red },
    DiffText = { fg = colors.red, italic = true },
    diffAdded = { link = "DiffAdd" },
    diffRemoved = { link = "DiffDelete" },
    diffChanged = { link = "DiffChange" },
    diffOldFile = { link = "DiffDelete" },
    diffNewFile = { link = "DiffAdd" },
    diffFile = { fg = colors.red, bg = colors.none, bold = true },
    diffLine = { link = "diffFile" },
    diffIndexLine = { fg = colors.orange, bg = colors.none },

    healthError = { fg = colors.red },
    healthSuccess = { fg = colors.green },
    healthWarning = { fg = colors.yellow },

    NonText = {
      fg = user_opts.transparent_background and colors.none or colors.bg,
      bg = user_opts.transparent_background and colors.none or colors.bg,
    },
    EndOfBuffer = { link = "NonText" },

    VertSplit = { fg = colors.fg, bg = colors.bg },

    ErrorMsg = { fg = colors.red },
    WarningMsg = { fg = colors.heavyyellow },

    Folded = { fg = colors.darkgrey, bg = colors.none, italic = true },
    FoldColumn = { bg = colors.bg_completion_sel },
    SignColumn = { fg = colors.fg, bg = user_opts.transparent_background and colors.none or colors.bg },

    IncSearch = { fg = colors.black, bg = colors.yellow },
    Substitute = { link = "IncSearch" },

    LineNr = { fg = colors.lowgrey, bg = user_opts.transparent_background and colors.none or colors.bg },
    LineNrAbove = { link = "LineNr" },
    LineNrBelow = { link = "LineNrAbove" },

    MatchParen = { fg = colors.heavyyellow, bg = colors.darkred },

    MsgArea = { fg = colors.white },
    ModeMsg = { link = "MsgArea" },
    MoreMsg = { link = "MsgArea" },

    Normal = { fg = colors.fg, bg = user_opts.transparent_background and colors.none or colors.bg },
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = colors.fg, bg = colors.bg_alt },
    FloatBorder = { link = "NormalFloat" },

    Pmenu = { fg = colors.fg, bg = colors.bg_completion },
    PmenuSbar = { bg = colors.bg_completion },
    PmenuSel = { fg = colors.white, bg = colors.bg_completion_sel },
    PmenuThumb = { bg = colors.lightgrey },

    Question = { fg = colors.yellow },

    QuickFixLine = { fg = colors.none, bg = colors.darkred },

    Search = { fg = colors.black, bg = colors.yellow },
    SpecialKey = { fg = colors.heavyyellow, bg = colors.none },

    SpellBad = { fg = colors.darkred, undercurl = true },
    SpellRare = { fg = colors.yellow, undercurl = true },
    SpellCap = { fg = colors.yellow, underline = true },
    SpellLocal = { fg = colors.orange, underline = true },

    StatusLine = { fg = colors.none, bg = colors.bg },
    StatusLineNC = { fg = colors.none, bg = colors.black },

    TabLine = { fg = colors.lightgrey, bg = colors.bg },
    TabLineFill = { fg = colors.none, bg = colors.bg },
    TabLineSel = { fg = colors.white, bg = colors.darkblue },

    Title = { fg = colors.heavyyellow, underline = true, bold = true },

    Visual = { fg = colors.none, bg = colors.darkred },
    VisualNOS = { link = "Visual" },

    Whitespace = { fg = colors.bg, bg = colors.none },

    WildMenu = { fg = colors.bg, bg = colors.fg },

    WinBar = { fg = colors.white, bg = colors.bg },
    WinBarNC = { fg = colors.fg, bg = colors.bg },

    TermCursor = { fg = colors.none, bg = colors.white },
    TermCursorNC = { fg = colors.none, bg = colors.fg },

    -- LSP --
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.heavyyellow },
    DiagnosticInfo = { fg = colors.shinyblue },
    DiagnosticHint = { fg = colors.white },
    DiagnosticTruncateLine = { fg = colors.fg },

    DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.heavyyellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.shinyblue, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.white, undercurl = true },

    LspDiagnosticsError = { link = "DiagnosticError" },
    LspDiagnosticsWarning = { link = "DiagnosticWarn" },
    LspDiagnosticsInformation = { link = "DiagnosticInfo" },
    LspDiagnosticsHint = { link = "DiagnosticHint" },

    LspSignatureActiveParameter = {
      fg = colors.orange,
      bg = colors.fg_alt,
      italic = user_opts.italic,
      bold = user_opts.bold,
    },

    -- Plugins --
    -- Telescope
    -- Sets the highlight for selected items within the picker.
    TelescopeSelection = { fg = colors.white },
    TelescopeSelectionCaret = { link = "TelescopeSelection" },
    TelescopeMultiSelection = { link = "TelescopeSelection" },
    TelescopeMultiIcon = { link = "TelescopeSelectionCaret" },

    TelescopeTitle = { fg = colors.white },

    TelescopeBorder = { fg = colors.fg },

    TelescopePrompt = { link = "TelescopeNormal" },
    TelescopePromptPrefix = { link = "TelescopeSelectionCaret" },
    TelescopeMatching = { fg = colors.yellow },

    -- nvim-cmp
    CmpItemKind = { fg = colors.heavyyellow },
    CmpItemAbbrMatch = { fg = colors.yellow, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.lightgrey, bold = true },
    CmpItemAbbr = { fg = colors.lighgrey },
    CmpItemMenu = { fg = colors.lightgrey },
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

    -- gitsigns
    GitSignsAddLn = { fg = colors.darkgreen },
    GitSignsAddNr = { fg = colors.darkgreen },
    GitSignsChangeLn = { fg = colors.yellow },
    GitSignsChangeNr = { fg = colors.yellow },
    GitSignsDeleteLn = { fg = colors.darkred },
    GitSignsDeleteNr = { fg = colors.darkred },
    GitSignsCurrentLineBlame = { fg = colors.orange, bold = true },

    -- git gutter
    GitGutterAdd = { fg = colors.green },
    GitGutterChange = { fg = colors.yellow },
    GitGutterDelete = { fg = colors.red },
    GitGutterChangeDelete = { fg = colors.red },

    -- lspsaga
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

    -- nvim-tree
    NvimTreeRootFolder = { fg = colors.heavyyellow, bold = true },
    NvimTreeGitDirty = { fg = colors.orange },
    NvimTreeGitNew = { fg = colors.green },
    NvimTreeImageFile = { fg = colors.pink },
    NvimTreeExecFile = { fg = colors.fg },
    NvimTreeSpecialFile = { fg = colors.yellow, underline = true },
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeEmptyFolderName = { fg = colors.fg },
    NvimTreeFolderIcon = { fg = colors.shinyblue },
    NvimTreeIndentMarker = { fg = colors.white },

    -- packer
    packerString = { fg = colors.darkgreen, bg = colors.none },
    packerHash = { fg = colors.yellow, bg = colors.none, bold = true },
    packerRelDate = { fg = colors.lightgrey, bold = true, underline = true },
    packerSuccess = { fg = colors.green, bg = colors.none, bold = true },
    packerStatusSuccess = { link = "PackerSuccess" },

    -- indent blankline
    IndentBlanklineChar = { fg = colors.lowgrey },
    IndentBlanklineContextChar = { fg = colors.shinyblue },

    -- neo-tree
    NeoTreeRootName = { fg = colors.fg, bold = true },

    -- notify
    NotifyERROR = { fg = colors.red },
    NotifyWARN = { fg = colors.yellow },
    NotifyINFO = { fg = colors.fg },
    NotifyDEBUG = { fg = colors.midblue },
    NotifyTRACE = { fg = colors.lightgrey },
    NotifyERRORTitle = { link = "NotifyERROR" },
    NotifyWARNTitle = { link = "NotifyWARN" },
    NotifyINFOTitle = { link = "NotifyINFO" },
    NotifyDEBUGTitle = { link = "NotifyDEBUG" },
    NotifyTRACETitle = { link = "NotifyTRACE" },

    -- dashboard
    DashboardShortCut = { fg = colors.orange },
    DashboardHeader = { fg = colors.darkgreen },
    DashboardCenter = { fg = colors.heavyyellow },
    DashboardFooter = { fg = colors.fg, italic = true },

    -- Bufferline.nvim
    BufferLineFill = { bg = colors.ui.bufferline.separator_fg },
    BufferLineBufferSelected = { bg = colors.ui.bufferline.tab_bg, fg = colors.white, italic = true, bold = true },
    BufferLineSeparator = { fg = colors.ui.bufferline.separator_fg, bg = colors.ui.bufferline.separator_bg },
    BufferLineSeparatorSelected = { link = "BufferLineSeparator" },
    BufferLineSeparatorVisible = { link = "BufferLineSeparator" },

    BufferLineTab = { bg = colors.ui.bufferline.tab_bg, fg = colors.midblue },
    BufferLineTabSelected = { link = "BufferLineBufferSelected" },
    BufferLineTabClose = { bg = colors.ui.bufferline.separator_fg, fg = colors.lightgrey },
    BufferLineTabSeparator = { link = "BufferLineSeparator" },
    BufferLineTabSeparatorSelected = { link = "BufferLineSeparator" },

    BufferLineErrorSelected = {
      bg = colors.ui.bufferline.tab_bg,
      fg = colors.red,
      italic = true,
      bold = true,
      sp = colors.darkred,
    },
    BufferLineError = { fg = colors.darkred, bg = colors.ui.bufferline.tab_bg },
    BufferLineErrorDiagnostic = { link = "BufferLineError" },
    BufferLineErrorDiagnosticSelected = { link = "BufferLineErrorSelected" },
  }
end

function M.get_treesitter()
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
    ["@lsp.type.parameter"] = { fg = colors.shinyblue, italic = true },
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
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.darkgrey },

    ["@constructor"] = { link = "@lsp.type.class" },
    ["@field"] = { link = "@lsp.type.property" },
    ["@variable"] = { link = "@lsp.type.variable" },
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

    -- Typescript
    ["@type.qualifier.typescript"] = { link = "Statement" },
    ["@constant.builtin.typescript"] = { link = "Boolean" },
  }
end

---Load the terminal colors.
function M.load_terminal_colors()
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.darkgreen
  vim.g.terminal_color_3 = colors.green
  vim.g.terminal_color_4 = colors.darkblue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.darkgreen
  vim.g.terminal_color_7 = colors.lightgrey
  vim.g.terminal_color_8 = colors.heavyyellow
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.midblue
  vim.g.terminal_color_11 = colors.orange
  vim.g.terminal_color_12 = colors.red
  vim.g.terminal_color_13 = colors.darkred
  vim.g.terminal_color_14 = colors.orange
  vim.g.terminal_color_15 = colors.yellow
end

return M
