vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true -- Don't ignore case with capitals

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
vim.opt.hlsearch = true
-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.updatetime = 50

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Setup autor read for files
vim.opt.autoread = true

-- Sync clipboard between OS and Neovim.
-- vim.opt.clipboard = "unnamedplus"

-- Set backspace behavior
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.listchars = {
  tab = "→ ", -- Tab character
  trail = "•", -- Trailing whitespace
  extends = "…", -- Lines that extend past the window
  precedes = "…", -- Lines that precede the start of the window
  nbsp = "•", -- Non-breaking spaces
  eol = "↲",
  space = "·",
}

-- Completition
vim.opt.completeopt = "menu,menuone"
