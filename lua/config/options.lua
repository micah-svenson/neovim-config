-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python")

-- This makes tabbing work in xml. Seems to not affect other file types
vim.opt_global.tabstop = 4
vim.opt_global.shiftwidth = 4

vim.opt_global.expandtab = true
vim.opt_global.autoindent = true
vim.opt_global.smarttab = true
