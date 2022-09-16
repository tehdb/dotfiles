local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
  --[[ colored = true,   -- Displays filetype icon in color if set to true ]]
  --[[ icon_only = false, -- Display only an icon for filetype ]]
  --[[ icon = { align = 'right' }, -- Display filetype icon on the right hand side ]]
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		icons_enabled = true,
    theme = "auto", -- auto, powerline
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { 
      "alpha", 
      "startify",
      "dashboard", 
      "NvimTree", 
      "nvim-tree", 
      "Outline", 
      "packer", 
      "fxf", 
      "quickfix" ,
      "telescope"
    },
		always_divide_middle = true,
	},
	-- sections = {
	-- 	lualine_a = { branch, diagnostics },
	-- 	lualine_b = { mode },
	-- 	lualine_c = {},
	-- 	-- lualine_x = { "encoding", "fileformat", "filetype" },
	-- 	lualine_x = { diff, spaces, "encoding", filetype },
	-- 	lualine_y = { location },
	-- 	lualine_z = { progress },
	-- },
	sections = {
		lualine_a = { "mode", "filename" },
		lualine_b = {},
		lualine_c = { diagnostics },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		--[[ lualine_x = { { 'diff', source = diff_source }, spaces, "encoding", filetype }, ]]  -- shows also git diff - addes/removed/changed lines
		lualine_x = { spaces, "encoding", filetype },
		lualine_y = { location },
		--[[ lualine_z = { progress }, ]]
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
