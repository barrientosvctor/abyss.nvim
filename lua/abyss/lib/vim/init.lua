-- Reference:
-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/shared.lua
-- https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/vim/init.lua

local M = {}

---Splits an input and return it in a new table. Guided by a separator.
---@param inputstr string|number
---@param sep string|number
function M.split(inputstr, sep)
    sep = sep or "%s"
    local t = {}
    for field, s in string.gmatch(inputstr, "([^" .. sep .. "]*)(" .. sep .. "?)") do
        table.insert(t, field)
        if s == "" then
            return t
        end
    end
end


---Checks whether the table is empty or not.
---@param tbl table
---@return boolean
function M.tbl_isempty(tbl)
    assert(type(tbl) == "table", string.format("Expected table, got %s", type(tbl)))
    return next(tbl) == nil
end

---Checks whether the table is a list or not.
---@param tbl table
---@return boolean
function M.tbl_islist(tbl)
  if type(tbl) ~= "table" then
    return false
  end

  local count = 0

  for k, _ in pairs(tbl) do
    if type(k) == "number" then
      count = count + 1
    else
      return false
    end
  end

  if count > 0 then
    return true
  else
    -- TODO(bfredl): in the future, we will always be inside nvim
    -- then this check can be deleted.
    if vim._empty_dict_mt == nil then
      return false
    end
    return getmetatable(tbl) ~= vim._empty_dict_mt
  end
end

---Checks whether the table can be merged or not.
---@param tbl table
---@return boolean
function M.can_merge(tbl)
  return type(tbl) == "table" and (M.tbl_isempty(tbl) or not M.tbl_islist(tbl))
end

---Extends a table1 with the properties of table2.
---@param behavior "error"|"force"|"keep"
function M.tbl_extend(behavior, deep_extend, ...)
  if behavior ~= "error" and behavior ~= "keep" and behavior ~= "force" then
    error('invalid "behavior": ' .. tostring(behavior))
  end

  if select("#", ...) < 2 then
    error("wrong number of arguments (given " .. tostring(1 + select("#", ...)) .. ", expected at least 3)")
  end

  local ret = {}
  if vim._empty_dict_mt ~= nil and getmetatable(select(1, ...)) == vim._empty_dict_mt then
    ret = vim.empty_dict()
  end

  for i = 1, select("#", ...) do
    local tbl = select(i, ...)
    if tbl then
      for k, v in pairs(tbl) do
        if deep_extend and M.can_merge(v) and M.can_merge(ret[k]) then
          ret[k] = M.tbl_extend(behavior, true, ret[k], v)
        elseif behavior ~= "force" and ret[k] ~= nil then
          if behavior == "error" then
            error("key found in more than one map: " .. k)
          end -- Else behavior is "keep".
        else
          ret[k] = v
        end
      end
    end
  end
  return ret
end

return M
