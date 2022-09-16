local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>",                                                                            "Alpha" },
	["b"] = {
		-- "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"<cmd>lua require('telescope.builtin').buffers({ previewer = false })<cr>",                         "Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>",                                                                  "Explorer" },
	["E"] = { "<cmd>NvimTreeFocus<cr>",                                                                   "Explorer focus" },
	["w"] = { "<cmd>w!<cr>",                                                                              "Save" },
	["q"] = { "<cmd>q!<cr>",                                                                              "Quit" },
	["c"] = { "<cmd>Bdelete!<cr>",                                                                        "Close Buffer" },
	["T"] = { "<cmd>tabclose!<cr>",                                                                       "Close Tab" },
	["h"] = { "<cmd>nohlsearch<cr>",                                                                      "No Highlight" },
	["f"] = {
		-- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"<cmd>lua require('telescope.builtin').find_files({ previewer = false })<cr>",                      "Find files",
	},
	-- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["F"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_raw()<cr>",               "Find Text" },
	["C"] = { "<cmd>Telescope grep_string theme=ivy<cr>",                                                 "Find Text under cursor" },
	-- ["B"] = { "<cmd>Telescope file_browser theme=ivy<cr>", "File browser" },
	["O"] = { "<Plug>(openbrowser-open)",                                                                 "Open link" },
	["P"] = { "<cmd>Telescope projects<cr>",                                                              "Projects" },
	["R"] = { "<cmd>e!<CR>",                                                                              "Reload buffer" },
	["D"] = { "<cmd>lua print(vim.fn.getcwd())<cr>",                                                      "Get cwd" },

  B = {
    name = "Current buffer",
    n = { "<CMD>let @+ = expand('%:t')<CR>",                                                            "Copy file name     |" },
    r = { "<CMD>let @+ = expand('%')<CR>",                                                              "Copy relative path |" },
    a = { "<CMD>let @+ = expand('%:p')<CR>",                                                            "Copy absolute path |" },
    d = { "<CMD>let @+ = expand('%:h')<CR>",                                                            "Copy relative dir  |" },
    R = { "<CMD>echo expand('%')<CR>",                                                                  "Show relative path |" },
    A = { "<CMD>echo expand('%:p')<CR>",                                                                "Show absoulte path |" },
    D = { "<CMD>echo expand('%:h')<CR>",                                                                "Show relative dir  |" }
  },

  d = {
    name = "Debug",
    a = { "<CMD>lua require 'user.dap'.attach(vim.fn.input('Port: '))<CR>",                             "Attatch              |" },
    A = { "<CMD>lua require'dap'.terminate()<CR>",                                                      "Terminate            |" },
    b = { "<CMD>lua require'dap'.toggle_breakpoint()<CR>",                                              "Toggle Breakpoint    |" },
    B = { "<CMD>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",           "Breakpoint Condition |" },
    z = { "<CMD>lua require'dap'.clear_breakpoints()<CR>",                                              "Clear Breakpoints    |" },
    h = { "<CMD>lua require'dap.ui.widgets'.hover()<CR>",                                               "Hover                |" },
    s = { "<CMD>local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",      "Scopes               |" },
    k = { "<CMD>lua require'dap'.up()<CR>zz",                                                           "Breakpoint Condition |" },
    j = { "<CMD>lua require'dap'.down()<CR>zz",                                                         "Breakpoint Condition |" },
    f = { "<CMD>Telescope dap frames<CR>",                                                              "Show Frames          |" },
    l = { "<CMD>Telescope dap list_breakpoints<CR>",                                                    "List Breakpoints     |" }
  },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>",                                                                     "Compile" },
		i = { "<cmd>PackerInstall<cr>",                                                                     "Install" },
		s = { "<cmd>PackerSync<cr>",                                                                        "Sync" },
		S = { "<cmd>PackerStatus<cr>",                                                                      "Status" },
		u = { "<cmd>PackerUpdate<cr>",                                                                      "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                                                             "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>",                                                "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",                                                "Prev Hunk" },
		b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                               "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                                             "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                               "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                                             "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                                               "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                                          "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>",                                                              "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>",                                                            "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>",                                                             "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>",                                                            "Diff" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>",                                                     "Code Action" },
		d = { "<cmd>Telescope lsp_document_diagnostics<cr>",                                                "Document Diagnostics", },
		w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>",                                               "Workspace Diagnostics", },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>",                                                      "Format" },
		i = { "<cmd>LspInfo<cr>",                                                                           "Info" },
		I = { "<cmd>LspInstallInfo<cr>",                                                                    "Installer Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",                                                "Next Diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",                                                "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>",                                                        "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",                                              "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>",                                                          "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>",                                                    "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                                           "Workspace Symbols" },
	},
	s = {
		name = "Search",

	  -- T = { "<cmd>Telescope live_grep grep_args=-g='*.{ts}' theme=ivy<cr>", "Find in *.ts" },
	  -- H = { "<cmd>Telescope live_grep grep_args=\"-g='*.{html}'\" theme=ivy<cr>", "Find in *.html" },
	  -- S = { "<cmd>Telescope live_grep grep_args=-g='*.{css,scss,sass}' theme=ivy<cr>", "Find in *.scss" },
		f = { "<CMD>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>",                     "Fuzzy find in buffer - s  |" },

		s = { "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",     "Easy motion forward - s  |" },
		S = { "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",    "Easy motion backward - S |" },

		b = { "<cmd>Telescope git_branches<cr>",                                                            "Checkout branch  |" },
		c = { "<cmd>Telescope colorscheme<cr>",                                                             "Colorscheme      |" },
		h = { "<cmd>Telescope help_tags<cr>",                                                               "Find Help        |" },
		M = { "<cmd>Telescope man_pages<cr>",                                                               "Man Pages        |" },
		r = { "<cmd>Telescope oldfiles<cr>",                                                                "Open Recent File |" },
		R = { "<cmd>Telescope registers<cr>",                                                               "Registers        |" },
		k = { "<cmd>Telescope keymaps<cr>",                                                                 "Keymaps          |" },
		C = { "<cmd>Telescope commands<cr>",                                                                "Commands         |" },
	},

	-- t = {
	-- 	name = "Terminal",
	-- 	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	-- 	-- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
	-- 	t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	-- 	-- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	-- 	m = { "<cmd>lua _VIFM_TOGGLE()<cr>", "Vifm" },
	-- 	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	-- 	h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	-- 	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	-- },

	m = {
		name = "Marks",
		t = { "<Plug>(Marks-toggle)",                                                                       "Toggle mark - mm      |" },
		d = { "<Plug>(Marks-deletebuf)",                                                                    "Delete all marks - md |" },
		n = { "<Plug>(Marks-next)",                                                                         "Next mark - mn        |" },
		p = { "<Plug>(Marks-prev)",                                                                         "Prev mark - mN        |" },
		l = { "<cmd>MarksListBuf<cr>",                                                                      "Marks curr buf        |" },
		a = { "<cmd>MarksListAll<cr>",                                                                      "All marks             |" },
		s = { "<cmd>MarksQFListAll<cr>",                                                                    "All marks in sidebar  |" },
	},

	y = {
		name = "Yanks",
    y = { "<cmd>lua require('telescope').extensions.neoclip.default()<cr>",                               "Yank history"}
		--[[ h = { "<cmd>Yanks<cr>",                                                                             "Yank history           |" }, ]]
		--[[ n = { "<plug>(YoinkPostPasteSwapBack)",                                                             "Next yank - <C-p><C-p> |" }, ]]
		--[[ p = { "<plug>(YoinkPostPasteSwapForward)",                                                          "Prev yank - <C-p><C-n> |" }, ]]
		--[[ z = { "<cmd>ClearYanks<cr>",                                                                        "Clear history          |" }, ]]
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
