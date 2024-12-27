local M = {}

---Get the current mode text
---@return string
local function get_mode_text()
    return string.format(" %s ", string.upper(vim.api.nvim_get_mode().mode))
end

---Get the highlight of the text for the current mode
---@param mode string
---@return string
local function get_mode_hl(mode)
    local mode_color = ""
    if mode == "n" or mode == "no" then
        mode_color = "%#StatusLineNormalModeColor#"
    elseif mode == "i" or mode == "ic" then
        mode_color = "%#StatusLineInsertModeColor#"
    elseif mode == "v" then
        mode_color = "%#StatusLineVisualModeColor#"
    elseif mode == "V" then
        mode_color = "%#StatusLineVisualLineModeColor#"
    elseif mode == "s" then
        mode_color = "%#StatusLineSelectModeColor#"
    elseif mode == "S" then
        mode_color = "%#StatusLineSelectLineModeColor#"
    elseif mode == "R" then
        mode_color = "%#StatusLineReplaceModeColor#"
    elseif mode == "Rv" then
        mode_color = "%#StatusLineVisualReplaceModeColor#"
    elseif mode == "c" then
        mode_color = "%#StatusLineCommandModeColor#"
    elseif mode == "cv" then
        mode_color = "%#StatusLineVimExModeColor#"
    elseif mode == "ce" then
        mode_color = "%#StatusLineExModeColor#"
    elseif mode == "r" then
        mode_color = "%#StatusLinePromptModeColor#"
    elseif mode == "rm" then
        mode_color = "%#StatusLineMoarModeColor#"
    elseif mode == "r?" then
        mode_color = "%#StatusLineConfirmModeColor#"
    elseif mode == "!" then
        mode_color = "%#StatusLineShellModeColor#"
    elseif mode == "t" then
        mode_color = "%#StatusLineTerminalModeColor#"
    else
        mode_color = "%#StatusLineNormalModeColor#"
    end
    return mode_color
end

---Get the filename of the current file
---@return string
local function get_cur_fname()
    local filename = vim.fn.expand("%:t")
    if filename == "" then
        return "[No Name] "
    end
    return filename .. " "
end

---Get the filetype of the current file
---@return string
local function get_cur_ftype()
    return string.format(" %s ", vim.bo.filetype)
end

---Get the icon for the current filetype
---@return string
local function get_file_icon()
    local di = require("nvim-web-devicons")
    local _, color = di.get_icon_color_by_filetype(vim.bo.filetype)
    vim.api.nvim_set_hl(0, 'StatusLineFileIconColor',
        { fg = color, bold = false })
    return " %#StatusLineFileIconColor#" .. di.get_icon_by_filetype(vim.bo.filetype, {}) .. " "
end

---Get the current line an column
---@return string
local function get_line_info()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')

    return string.format(" %d:%d ", line, col)
end

---Get the current git branch if it exists
---@return string
local function get_git_branch()
    local cwd = vim.fn.expand("%:p:h")
    local git_branch = io.popen("git -C " .. cwd .. " rev-parse --abbrev-ref HEAD 2> /dev/null")
    if git_branch then
        local name = git_branch:read("*l")
        git_branch:close()
        if name then
            return "  " .. name .. " "
        end
    end
    return ""
end

function _G.neostatus_show()
    require("neostatus.highlights")
    return table.concat({
        get_mode_hl(vim.api.nvim_get_mode().mode),
        get_mode_text(),
        get_file_icon(),
        "%#StatusLineFilenameColor#",
        get_cur_fname(),
        "%#StatusLineFgColor#",
        get_line_info(),
        -- seperator for other section
        "%=",
        "%#StatusLineGitBranchColor#",
        get_git_branch(),
        "%#StatusLineFgColor#",
        get_cur_ftype(),
    })
end

function M.setup()
    vim.o.statusline = "%{%v:lua.neostatus_show()%}"
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.o.statusline = "%{%v:lua.neostatus_show()%}"
    end
})

vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        vim.o.statusline = "%{%v:lua.neostatus_show()%}"
    end
})

return M
