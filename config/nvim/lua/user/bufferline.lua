local status_ok, _ = pcall(require, "barbar")
if not status_ok then
  return
end

vim.g.bufferline = {

  animation = false,
  auto_hide = true,   -- auto-hiding the tab bar when there is a single buffer
  tabpages = true,    -- current/total tabpages indicator (top right corner)
  closable = false,   -- Enable/disable close button
  clickable = false,  -- 
}
