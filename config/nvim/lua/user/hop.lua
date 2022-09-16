-- Docs - https://github.com/phaazon/hop.nvim#usage

local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

vim.cmd("hi HopNextKey guifg=#cc7900")
vim.cmd("hi HopNextKey1 guifg=#cc7900")
vim.cmd("hi HopNextKey2 guifg=#cc7900")

hop.setup()

local opts = { noremap = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "s", "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", opts)
keymap("n", "S", "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", opts)
