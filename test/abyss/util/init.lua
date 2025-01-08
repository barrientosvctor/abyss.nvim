local utils = require("abyss.lib.util")
local M = {}

M.base_spec_length = 10
M.diff_spec_length = 5
M.editor_spec_length = 8
M.syntax_spec_length = 13
M.terminal_spec_length = 16
M.diagnostics_spec_length = 5
M.dirtree_spec_length = 3
M.lualine_spec_length = 17

---Checks if the spec has all its properties.
---@param spec Spec
function M.check_properties(spec)
  -- BASE TABLE --
  assert.is.truthy(spec.base)

  assert.is.truthy(spec.base.bg0)
  assert.is.truthy(spec.base.bg1)
  assert.is.truthy(spec.base.bg2)
  assert.is.truthy(spec.base.bg00)
  assert.is.truthy(spec.base.bg01)
  assert.is.truthy(spec.base.fg0)
  assert.is.truthy(spec.base.fg1)
  assert.is.truthy(spec.base.fg2)
  assert.is.truthy(spec.base.fg00)
  assert.is.truthy(spec.base.fg01)

  -- EDITOR TABLE --
  assert.is.truthy(spec.editor)

  assert.is.truthy(spec.editor.cursor)
  assert.is.truthy(spec.editor.cursor_selection)
  assert.is.truthy(spec.editor.cursorline)
  assert.is.truthy(spec.editor.title)
  assert.is.truthy(spec.editor.match)
  assert.is.truthy(spec.editor.match_selected)
  assert.is.truthy(spec.editor.nontext)
  assert.is.truthy(spec.editor.linenr)

  -- SYNTAX TABLE --
  assert.is.truthy(spec.syntax)

  assert.is.truthy(spec.syntax.comment)
  assert.is.truthy(spec.syntax.constant)
  assert.is.truthy(spec.syntax.string)
  assert.is.truthy(spec.syntax.number)
  assert.is.truthy(spec.syntax.identifier)
  assert.is.truthy(spec.syntax.func)
  assert.is.truthy(spec.syntax.statement)
  assert.is.truthy(spec.syntax.type)
  assert.is.truthy(spec.syntax.structure)
  assert.is.truthy(spec.syntax.regex)
  assert.is.truthy(spec.syntax.special)
  assert.is.truthy(spec.syntax.bracket)
  assert.is.truthy(spec.syntax.parameter)

  -- DIFF TABLE --
  assert.is.truthy(spec.diff)

  assert.is.truthy(spec.diff.added)
  assert.is.truthy(spec.diff.changed)
  assert.is.truthy(spec.diff.deleted)
  assert.is.truthy(spec.diff.text)
  assert.is.truthy(spec.diff.untracked)

  -- DIAGNOSTICS TABLE --
  assert.is.truthy(spec.diagnostics)

  assert.is.truthy(spec.diagnostics.error)
  assert.is.truthy(spec.diagnostics.warn)
  assert.is.truthy(spec.diagnostics.info)
  assert.is.truthy(spec.diagnostics.hint)
  assert.is.truthy(spec.diagnostics.ok)

  -- DIRTREE TABLE --
  assert.is.truthy(spec.dirtree)

  assert.is.truthy(spec.dirtree.rootname)
  assert.is.truthy(spec.dirtree.dirname)
  assert.is.truthy(spec.dirtree.curline)

  -- TERMINAL TABLE --
  assert.is.truthy(spec.terminal)

  assert.is.truthy(spec.terminal.color0)
  assert.is.truthy(spec.terminal.color1)
  assert.is.truthy(spec.terminal.color2)
  assert.is.truthy(spec.terminal.color3)
  assert.is.truthy(spec.terminal.color4)
  assert.is.truthy(spec.terminal.color5)
  assert.is.truthy(spec.terminal.color6)
  assert.is.truthy(spec.terminal.color7)
  assert.is.truthy(spec.terminal.color8)
  assert.is.truthy(spec.terminal.color9)
  assert.is.truthy(spec.terminal.color10)
  assert.is.truthy(spec.terminal.color11)
  assert.is.truthy(spec.terminal.color12)
  assert.is.truthy(spec.terminal.color13)
  assert.is.truthy(spec.terminal.color14)
  assert.is.truthy(spec.terminal.color15)

  -- LUALINE TABLE --
  assert.is.truthy(spec.lualine)

  assert.is.truthy(spec.lualine.normalfg)
  assert.is.truthy(spec.lualine.normalbg_a)
  assert.is.truthy(spec.lualine.visualfg)
  assert.is.truthy(spec.lualine.visualbg_a)
  assert.is.truthy(spec.lualine.replacefg)
  assert.is.truthy(spec.lualine.replacebg_a)
  assert.is.truthy(spec.lualine.insertfg)
  assert.is.truthy(spec.lualine.insertbg_a)
  assert.is.truthy(spec.lualine.commandfg)
  assert.is.truthy(spec.lualine.commandbg_a)
  assert.is.truthy(spec.lualine.terminalfg)
  assert.is.truthy(spec.lualine.terminalbg_a)
  assert.is.truthy(spec.lualine.inactivefg)
  assert.is.truthy(spec.lualine.inactivebg_a)
end

---Checks if all the tables of the spec have the same amount of properties.
---@param spec Spec
function M.check_properties_length(spec)
    assert.are.equals(M.base_spec_length, utils.table_length(spec.base))
    assert.are.equals(M.diff_spec_length, utils.table_length(spec.diff))
    assert.are.equals(M.editor_spec_length, utils.table_length(spec.editor))
    assert.are.equals(M.syntax_spec_length, utils.table_length(spec.syntax))
    assert.are.equals(M.terminal_spec_length, utils.table_length(spec.terminal))
    assert.are.equals(M.diagnostics_spec_length, utils.table_length(spec.diagnostics))
    assert.are.equals(M.dirtree_spec_length, utils.table_length(spec.dirtree))
    assert.are.equals(M.lualine_spec_length, utils.table_length(spec.lualine))
end

---Checks if all spec properties have the same expected type.
---@param spec Spec
function M.check_typeof(spec)
  local property_expected_type = type("")
  local table_expected_type = type({})

  -- BASE TABLE --
  assert.are.same(table_expected_type, type(spec.base))
  assert.are.same(property_expected_type, type(spec.base.bg0))
  assert.are.same(property_expected_type, type(spec.base.bg1))
  assert.are.same(property_expected_type, type(spec.base.bg2))
  assert.are.same(property_expected_type, type(spec.base.bg00))
  assert.are.same(property_expected_type, type(spec.base.bg01))
  assert.are.same(property_expected_type, type(spec.base.fg0))
  assert.are.same(property_expected_type, type(spec.base.fg1))
  assert.are.same(property_expected_type, type(spec.base.fg2))
  assert.are.same(property_expected_type, type(spec.base.fg00))
  assert.are.same(property_expected_type, type(spec.base.fg01))

  -- EDITOR TABLE --
  assert.are.same(table_expected_type, type(spec.editor))
  assert.are.same(property_expected_type, type(spec.editor.cursor))
  assert.are.same(property_expected_type, type(spec.editor.cursor_selection))
  assert.are.same(property_expected_type, type(spec.editor.cursorline))
  assert.are.same(property_expected_type, type(spec.editor.title))
  assert.are.same(property_expected_type, type(spec.editor.match))
  assert.are.same(property_expected_type, type(spec.editor.match_selected))
  assert.are.same(property_expected_type, type(spec.editor.nontext))
  assert.are.same(property_expected_type, type(spec.editor.linenr))

  -- SYNTAX TABLE --
  assert.are.same(table_expected_type, type(spec.syntax))
  assert.are.same(property_expected_type, type(spec.syntax.comment))
  assert.are.same(property_expected_type, type(spec.syntax.constant))
  assert.are.same(property_expected_type, type(spec.syntax.string))
  assert.are.same(property_expected_type, type(spec.syntax.number))
  assert.are.same(property_expected_type, type(spec.syntax.identifier))
  assert.are.same(property_expected_type, type(spec.syntax.func))
  assert.are.same(property_expected_type, type(spec.syntax.statement))
  assert.are.same(property_expected_type, type(spec.syntax.type))
  assert.are.same(property_expected_type, type(spec.syntax.structure))
  assert.are.same(property_expected_type, type(spec.syntax.regex))
  assert.are.same(property_expected_type, type(spec.syntax.special))
  assert.are.same(property_expected_type, type(spec.syntax.bracket))
  assert.are.same(property_expected_type, type(spec.syntax.parameter))

  -- DIFF TABLE --
  assert.are.same(table_expected_type, type(spec.diff))
  assert.are.same(property_expected_type, type(spec.diff.added))
  assert.are.same(property_expected_type, type(spec.diff.changed))
  assert.are.same(property_expected_type, type(spec.diff.deleted))
  assert.are.same(property_expected_type, type(spec.diff.text))
  assert.are.same(property_expected_type, type(spec.diff.untracked))

  -- DIAGNOSTICS TABLE --
  assert.are.same(table_expected_type, type(spec.diagnostics))
  assert.are.same(property_expected_type, type(spec.diagnostics.error))
  assert.are.same(property_expected_type, type(spec.diagnostics.warn))
  assert.are.same(property_expected_type, type(spec.diagnostics.info))
  assert.are.same(property_expected_type, type(spec.diagnostics.hint))
  assert.are.same(property_expected_type, type(spec.diagnostics.ok))

  -- DIRTREE TABLE --
  assert.are.same(table_expected_type, type(spec.dirtree))
  assert.are.same(property_expected_type, type(spec.dirtree.rootname))
  assert.are.same(property_expected_type, type(spec.dirtree.dirname))
  assert.are.same(property_expected_type, type(spec.dirtree.curline))

  -- TERMINAL TABLE --
  assert.are.same(table_expected_type, type(spec.terminal))
  assert.are.same(property_expected_type, type(spec.terminal.color0))
  assert.are.same(property_expected_type, type(spec.terminal.color1))
  assert.are.same(property_expected_type, type(spec.terminal.color2))
  assert.are.same(property_expected_type, type(spec.terminal.color3))
  assert.are.same(property_expected_type, type(spec.terminal.color4))
  assert.are.same(property_expected_type, type(spec.terminal.color5))
  assert.are.same(property_expected_type, type(spec.terminal.color6))
  assert.are.same(property_expected_type, type(spec.terminal.color7))
  assert.are.same(property_expected_type, type(spec.terminal.color8))
  assert.are.same(property_expected_type, type(spec.terminal.color9))
  assert.are.same(property_expected_type, type(spec.terminal.color10))
  assert.are.same(property_expected_type, type(spec.terminal.color11))
  assert.are.same(property_expected_type, type(spec.terminal.color12))
  assert.are.same(property_expected_type, type(spec.terminal.color13))
  assert.are.same(property_expected_type, type(spec.terminal.color14))
  assert.are.same(property_expected_type, type(spec.terminal.color15))

  -- LUALINE TABLE --
  assert.are.same(table_expected_type, type(spec.lualine))
  assert.are.same(property_expected_type, type(spec.lualine.normalfg))
  assert.are.same(property_expected_type, type(spec.lualine.normalbg_a))
  assert.are.same(property_expected_type, type(spec.lualine.visualfg))
  assert.are.same(property_expected_type, type(spec.lualine.visualbg_a))
  assert.are.same(property_expected_type, type(spec.lualine.replacefg))
  assert.are.same(property_expected_type, type(spec.lualine.replacebg_a))
  assert.are.same(property_expected_type, type(spec.lualine.insertfg))
  assert.are.same(property_expected_type, type(spec.lualine.insertbg_a))
  assert.are.same(property_expected_type, type(spec.lualine.commandfg))
  assert.are.same(property_expected_type, type(spec.lualine.commandbg_a))
  assert.are.same(property_expected_type, type(spec.lualine.terminalfg))
  assert.are.same(property_expected_type, type(spec.lualine.terminalbg_a))
  assert.are.same(property_expected_type, type(spec.lualine.inactivefg))
  assert.are.same(property_expected_type, type(spec.lualine.inactivebg_a))
end

return M
