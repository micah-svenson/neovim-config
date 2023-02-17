-- show line numbers and make them relative
vim.opt.nu = true
vim.opt.relativenumber = true

-- set tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- turn of swap files and setup undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- won't show highlights of matches
-- vim.opt.hlsearch = false

-- incremental search highlights matches as you type
vim.opt.incsearch = true

-- ensure good colors
vim.opt.termguicolors = true

-- add an 8 char buffer to the bottom of the viewport except for eof when scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"


-- Unless you are still migrating, remove the deprecated commands from v1.x
--vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.g.neo_tree_remove_legacy_commands = 1
