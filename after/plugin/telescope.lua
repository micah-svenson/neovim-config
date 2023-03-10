local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {}) -- project grep
vim.keymap.set('n', '<leader>pb', builtin.buffers, {}) -- project buffers
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {}) -- project help tags
vim.keymap.set('n', '<leader>bs', builtin.treesitter, {}) -- buffer search
vim.keymap.set('n', '<leader>ps', function() -- project search
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

vim.keymap.set('n', '<leader>gc', builtin.git_commits, {}) -- git log (commits)
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {}) -- git branches


vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {}) -- goto definition
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {}) -- goto implementation
vim.keymap.set('n', '<leader>lr', builtin.git_branches, {}) -- list references
vim.keymap.set('n', '<leader>vrr', builtin.lsp_references, {}) -- goto implementation


vim.keymap.set('n', '<leader>bd', function()
    builtin.diagnostics({ bufnr = 0 });
end)

-- I want to implement a combination file picker and live grep to easily search through notes in specific folders within my notes project. Here is a note on suggested implementation: https://www.reddit.com/r/neovim/comments/r74647/comment/hmx0w58/
