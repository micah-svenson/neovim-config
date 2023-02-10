local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = 'Add current file to harpoon list' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Toggle harpoon list' })

vim.keymap.set("n", "<C-h>", function() term.gotoTerminal(1) end, { desc = 'jump to first terminal' })
vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, { desc = 'jump to second file in harpoon list' })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, { desc = 'jump to third file in harpoon list' })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, { desc = 'jump to fourth file in harpoon list' })

