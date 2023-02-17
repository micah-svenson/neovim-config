-- project view (aka netrw)
--  For vert sidebar split, set to vim.cmd.Vexplore
--  For whole window, set to vim.cmd.Ex
-- vim.cmd.Git({'pull',  '--rebase'})
--vim.keymap.set("n", "<leader>pv", ":Neotree toggle reveal<cr>", { desc = "[P]roject [V]iew opens netrw" })
--vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree({"toggle", "reveal"}), { desc = "[P]roject [V]iew opens netrw" })
vim.keymap.set('n', '<leader>pv', function()
    vim.cmd.Neotree({ "toggle", "reveal" });
end)
