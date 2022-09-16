local status_ok, sidebar = pcall(require, "sidebar-nvim")
if not status_ok then
	return
end

-- TODO: needs proper setup for custom sections, see https://github.com/sidebar-nvim/sidebar.nvim/blob/main/doc/custom-sections.md
sidebar.setup({
	open = false,
	disable_default_keybindings = true,
	side = "left",
	initial_width = 40,
	update_interval = 2000,
	sections = { "datetime", "git-status", "lsp-diagnostics" },
	section_separator = "─────",
	bindings = {
		["q"] = function()
			require("sidebar-nvim").close()
		end,
		["<C-q>"] = function()
			require("sidebar-nvim").close()
		end,
	},
	datetime = {
		format = "%d.%m.%Y-%H:%M:%S",
		clocks = {
			naem = "andrew's clock",
		},
	},
})
