-- Manage yanks history - https://github.com/svermeulen/vim-yoink

vim.g.yoinkMaxItems = 10
vim.g.yoinkSyncNumberedRegisters = 1
vim.g.yoinkIncludeDeleteOperations = 1
vim.g.yoinkSyncSystemClipboardOnFocus = 0 -- see https://github.com/svermeulen/vim-yoink#system-clipboard
vim.g.yoinkSwapClampAtEnds = 1
vim.g.yoinkMoveCursorToEndOfPaste = 1

vim.g.yoinkSavePersistently = 0    -- if 1 yank history will be saved persistently across sessions

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
keymap("v", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})
keymap("x", "y", "<plug>(YoinkYankPreserveCursorPosition)", {})

keymap("n", "p", "<Plug>(YoinkPaste_p)", {})
keymap("n", "p", "<Plug>(YoinkPaste_p)", {})

keymap("n", "gp", "<Plug>(YoinkPaste_gp)", {})
keymap("n", "gP", "<Plug>(YoinkPaste_gP)", {})

keymap("v", "p", "<plug>(SubversiveSubstitute)", {})
keymap("v", "P", "<plug>(SubversiveSubstitute)", {})
keymap("x", "p", "<plug>(SubversiveSubstitute)", {})
keymap("x", "P", "<plug>(SubversiveSubstitute)", {})

keymap("n", "<c-p><c-p>", "<plug>(YoinkPostPasteSwapBack)", {})
keymap("n", "<c-p><c-n>", "<plug>(YoinkPostPasteSwapForward)", {})

