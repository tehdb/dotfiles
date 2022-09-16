local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "x", "d", opts)
keymap("n", "xx", "dd", opts)
keymap("n", "X", "D", opts)
keymap("x", "x", "d", opts)
