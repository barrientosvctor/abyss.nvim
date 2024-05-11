local M = {}

---Return the length of the table passed by parameter.
---@param tbl table
---@return number
function M.table_length(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

return M
