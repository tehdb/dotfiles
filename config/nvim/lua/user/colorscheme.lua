-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

vim.cmd [[
try
  colorscheme solarized
  set background=light
  " set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=light
  " set background=dark
endtry
]]

--
--
-- require('lualine').setup {
--   options = {
--     -- ... your lualine config
--     theme = 'solarized'
--     -- ... your lualine config
--   }
-- }

