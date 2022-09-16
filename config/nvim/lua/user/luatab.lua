
local status_ok, luatab = pcall(require, "lualine")
if not status_ok then
	return
end


local tab_title = function()
  local file = vim.fn.bufname(bufnr)
  local buftype = vim.fn.getbufvar(bufnr, '&buftype')
  local filetype = vim.fn.getbufvar(bufnr, '&filetype')

  if buftype == 'help' then
    return 'help:' .. vim.fn.fnamemodify(file, ':t:r')
  elseif buftype == 'quickfix' then
    return 'quickfix'
  elseif filetype == 'TelescopePrompt' then
    return 'Telescope'
  elseif filetype == 'git' then
    return 'Git'
  elseif filetype == 'fugitive' then
    return 'Fugitive'
  elseif file:sub(file:len()-2, file:len()) == 'FZF' then
      eturn 'FZF'
  elseif buftype == 'terminal' then
      local _, mtch = string.match(file, "term:(.*):(%a+)")
      return mtch ~= nil and mtch or vim.fn.fnamemodify(vim.env.SHELL, ':t')
  elseif file == '' then
      return '[No Name]'
  else
      return vim.fn.fnamemodify(file, ':p:~:t')
  end
end


luatab.setup({
  title = tab_title
})
