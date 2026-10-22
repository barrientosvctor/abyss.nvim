local test_utils = require("test.abyss.util.init")
local abyss = require("abyss.palettes.abyss")
local abyssboreal = require("abyss.palettes.abyss-boreal")

describe("Palettes of abyss", function()
  it("should have palette and spec property", function()
    assert(abyss.palette, "Abyss palette does not have a palette property.")
    assert(abyssboreal.palette, "Abyss Boreal palette does not have a palette property.")

    assert(abyss.spec, "Abyss palette does not have a spec property.")
    assert(abyssboreal.spec, "Abyss Boreal palette does not have a spec property.")
  end)

  it("has all spec properties.", function()
    test_utils.check_properties(abyss.spec)
    test_utils.check_properties(abyssboreal.spec)
  end)

  it("has the expected data type for property.", function()
    test_utils.check_typeof(abyss.spec)
    test_utils.check_typeof(abyssboreal.spec)
  end)

  it("has properties with expected length.", function()
    test_utils.check_properties_length(abyss.spec)
    test_utils.check_properties_length(abyssboreal.spec)
  end)
end)
