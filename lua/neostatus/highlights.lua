local colors = {
    bg = '#1a1b26',
    fg = '#c0caf5',
    black = '#15161e',
    red = '#f7768e',
    green = '#9ece6a',
    yellow = '#c0af68',
    blue = '#7aa2f7',
    magenta = '#bb9af7',
    cyan = '#7dcfff',
    white = '#a9b1d6'
}

vim.api.nvim_set_hl(0, 'StatusLineNormalModeColor', { fg = colors['blue'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineInsertModeColor', { fg = colors['green'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineVisualModeColor', { fg = colors['blue'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineVisualLineModeColor', { fg = colors['cyan'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineVisualBlockModeColor', { fg = colors['magenta'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineVisualReplaceModeColor', { fg = colors['yellow'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineSelectModeColor', { fg = colors['yellow'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineSelectLineModeColor', { fg = colors['white'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineSelectBlockModeColor', { fg = colors['blue'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineReplaceModeColor', { fg = colors['green'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineCommandModeColor', { fg = colors['blue'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineVimExModeColor', { fg = colors['cyan'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineExModeColor', { fg = colors['magenta'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLinePromptModeColor', { fg = colors['yellow'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineMoarModeColor', { fg = colors['white'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineConfirmModeColor', { fg = colors['blue'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineShellModeColor', { fg = colors['green'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineTerminalModeColor', { fg = colors['blue'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineFilenameColor', { fg = colors['magenta'], bold = true })
vim.api.nvim_set_hl(0, 'StatusLineFgColor', { fg = colors['fg'], bold = false })
vim.api.nvim_set_hl(0, 'StatusLineGitBranchColor', { fg = colors['green'], bold = false })
