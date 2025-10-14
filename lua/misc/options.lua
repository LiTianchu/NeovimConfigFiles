-- Normal Mode
-- Cusor line
vim.opt.cursorline = true

-- No Wrap
vim.opt.wrap = false

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Line number
vim.opt.number = true

-- Allow copy pasting with system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Enable mouse
vim.opt.mouse:append("a")

-- Case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Aesthetics
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Tabs
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- indent width (4 spaces)
vim.opt.tabstop = 4 -- tab display width
