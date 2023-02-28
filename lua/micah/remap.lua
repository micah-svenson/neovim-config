vim.g.mapleader = " "

-- clear highlighted search with ctrl+l. Inspired by terminal clear mapping
vim.keymap.set({"i", "v", "n"}, "<C-l>", ":nohl<CR><C-l>", { desc = "Clear highlights" })

vim.keymap.set("i", "kj", "<Esc>", { noremap = true, desc = "Ahh, much better way to escape insert mode"})

-- Helix inspired remaps because I never liked ^ and $
vim.keymap.set("n", "gh", "^", { desc = "[G]oto first char in line (h is chosen because its also a left movement" })
vim.keymap.set("n", "gl", "$", { desc = "[G]oto last char in line (l is chosen because its also a right movement" })

-- "Drag" selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Drag selection down one line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Drag selection up one line" })


-- Keep cursor in place as you are appending rows
vim.keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor in place when appending rows" })

-- Keep cursor in the middle of the screen when scrolling with d, u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor in the middle of the screen when scrolling down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor in the middle of the screen when scrolling up" })

-- keep search terms in the middle of the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep next search term in the middle of the screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep previous search terms in the middle of the screen" })

-- yanks into a secondary buffer so you dont lose your yank
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Yank into an alternate buffer so it doesnt get lost" })

-- next greatest remap ever : asbjornHaland
-- TODO: what does this do
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- TODO: what does this do
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

-- Look this up laterhttps://crates.io/crates/tmux-sessionizer
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat file using LSP" })

vim.keymap.set("n", "<leader>fp", "<cmd>!black %<CR>", { desc = "[F]ormat [P]ython file" });

-- TODO: learn how to use marks/tags?
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }, { desc = "Add executable permissions to the current buffer" })

-- terminal remaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true }, { desc = "Escape insert mode in a terminal" })

