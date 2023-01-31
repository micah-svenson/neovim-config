vim.g.mapleader = " "

-- clear highlighted search with ctrl+l
vim.keymap.set({"i", "v", "n"}, "<C-l>", ":nohl<CR><C-l>", {  })

-- escape crutch
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })

-- project view (aka netrw)
--  For vert sidebar split, set to vim.cmd.Vexplore
--  For whole window, set to vim.cmd.Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- "Drag" selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Keep cursor in place as you are appending rows
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle of the screen when scrolling with d, u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yanks into a secondary buffer so you dont lose your yank
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- TODO: what does this do
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- TODO: what does this do
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format your code using the current lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- TODO: learn how to use marks/tags?
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- TODO: what are these?
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- TODO: what are these?
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");

-- format file with black
vim.keymap.set("n", "<leader>ff", "<cmd>!black %<CR>");

-- terminal remaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

