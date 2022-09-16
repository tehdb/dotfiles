vim.cmd [[
try
  colorscheme solarized
  set background=light
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=light
endtry
]]

