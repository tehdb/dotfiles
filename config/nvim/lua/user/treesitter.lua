local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

return

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { 
    enable = true, 
    disable = { "yaml" } 
  },
	rainbow = {
		enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true   -- Also highlight non-bracket delimiters like html tags, boolean or table
 	},
	tree_docs = {
		enable = true,
    keymap = {
      doc_node_at_cursor = "gdd",
      doc_all_in_range = "gdd"
    }
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
