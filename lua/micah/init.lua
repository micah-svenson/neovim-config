require("micah.set")
require("micah.remap")

local augroup = vim.api.nvim_create_augroup
local micahgroup = augroup('MicahAuGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- TODO: what is this for?
function R(name)
	require('plenary.reload').reload_module(name)
end

-- TODO: What does this do?
autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function ()
		vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40
		})
	end,
})

-- TODO: What does this do?
autocmd({"BufWritePre"}, {
	group = micahgroup,
	pattern = '*',
	command = [[%s/\s\+$//e]],
})

-- remove netrw banner
vim.g.netrw_banner = 0
-- 3 is the tree view
vim.g.netrw_liststyle = 3
-- opens new file in previous window
vim.g.netrw_browse_split = 0
-- TODO: idk
vim.g.netrw_altv = 1
-- assuming vertical split, make it nice and small
vim.g.netrw_winsize = 25

