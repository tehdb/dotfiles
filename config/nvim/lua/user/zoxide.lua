local status_ok, zoxide = pcall(require, "telescope._extensions.zoxide.config")
if not status_ok then
	return
end

--[[ require'telescope'.load_extension('zoxide') ]]

vim.api.nvim_set_keymap(
	"n",
	"<leader>Z",
	":lua require'telescope'.extensions.zoxide.list{}<CR>",
	{noremap = true, silent = true}
)

--[[ zoxide.setup({ }) ]]
