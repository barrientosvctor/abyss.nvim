local vim_lib = require("abyss.lib.vim")

local M = {
    is_vim = vim.fn.has("nvim") ~= 1,
    is_nvim = vim.fn.has("nvim") == 1,
    log = {
        levels = {
            TRACE = 0,
            DEBUG = 1,
            INFO = 2,
            WARN = 3,
            ERROR = 4,
            OFF = 5,
        }
    }
}

---Execute a command for Vim or Neovim.
---@param cmd_args string
function M.command(cmd_args)
    if M.is_vim then
        vim.command(cmd_args)
    else
        vim.cmd(cmd_args)
    end
end

---Merges recursively two or more map-like tables.
---@param behavior string
---@param ... unknown
---@return table
function M.tbl_deep_extend(behavior, ...)
    return M.is_vim and vim_lib.tbl_extend(behavior, true, ...) or vim.tbl_deep_extend(behavior, ...)
end


--- Filter a table using a predicate function
---
---@generic T
---@param func fun(value: T): boolean (function) Function
---@param tbl table<any, T> (table) Table
---@return T[] (table) Table of filtered values
function M.tbl_filter(func, tbl)
    if M.is_vim then
        local rettab = {}
        for _, entry in pairs(tbl) do
            if func(entry) then
                table.insert(rettab, entry)
            end
        end
        return rettab
    end

    return vim.tbl_filter(func, tbl)
end


--- Display a notification to the user.
---
--- This function can be overridden by plugins to display notifications using a
--- custom provider (such as the system notification provider). By default,
--- writes to |:messages|.
---
---@param msg string Content of the notification to show to the user.
---@param level number|nil One of the values from |vim.log.levels|.
---@param opts table|nil Optional parameters. Unused by default.
function M.notify(msg, level, opts)
    if M.is_vim then
        if level == M.log.levels.ERROR then
            M.command("echohl ErrorMsg")
        elseif level == M.log.levels.WARN then
            M.command("echohl WarningMsg")
        end

        for _, value in ipairs(vim_lib.split(msg, "\n")) do
            M.command(string.format([[echo "%s"]], value))
        end

        M.command("echohl None")
    end

    return vim.notify(msg, level, opts)
end

---Highlight a group, like :Highlight command
---@param group string
---@param opts table
function M.highlight(group, opts)
    if M.is_vim then
        vim_lib.highlight_group(group, opts)
    else
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
