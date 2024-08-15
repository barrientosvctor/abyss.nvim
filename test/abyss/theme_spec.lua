local abyss = require("abyss")
local config = require("abyss.config")

describe("Abyss.nvim", function()
  before_each(function() vim.cmd.colorscheme("abyss") end)

  it("works with default setup", function()
    abyss.setup()
    assert.are.same(config.default_options, config.options)
  end)

  it("has correct colors_name", function() assert.are.same("abyss", vim.g.colors_name) end)

  it("should change the config", function()
    local expected = {
      italic_comments = false,
      italic = false,
      bold = true,
      transparent_background = true,
      treesitter = not vim.fn.has("nvim") ~= 1,
      overrides = nil,
    }

    abyss.setup({ italic_comments = false, bold = true, transparent_background = true })
    assert.are.same(expected, config.options)
  end)

  it("has nil overrides", function()
    abyss.setup()
    assert.are.are_nil(config.options.overrides, "Overrides property should be a nil value.")
  end)

  it("has overrides", function()
    abyss.setup({
      overrides = {
        String = { fg = "#fffa0c" },
      },
    })

    assert.are.not_nil(config.options.overrides, "Overrides property must not be a nil value.")
  end)

  describe("Treesitter option", function()
    it("should check if vim or neovim is running", function()
      abyss.setup()
      local is_vim = vim.fn.has("nvim") ~= 1
      if is_vim then
        assert.are.equals(is_vim, config.options.treesitter, "Treesitter must be disabled for Vim.")
      else
        assert.are.equals(not is_vim, config.options.treesitter, "Treesitter must be enabled for Neovim.")
      end
    end)
  end)
end)
