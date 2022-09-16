local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- install dir: ~/.local/share/nvim/site/pack/packer/start
  use "wbthomason/packer.nvim"                -- Package manager - https://github.com/wbthomason/packer.nvim
  use "goolord/alpha-nvim"                    -- 
  use "nvim-lua/popup.nvim"                   -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                 -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs"                 -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"                 -- Easily comment stuff - https://github.com/numToStr/Comment.nvim
  use "kyazdani42/nvim-tree.lua"              -- File Explorer - https://github.com/kyazdani42/nvim-tree.lua
  use "kyazdani42/nvim-web-devicons"          -- Icons - https://github.com/kyazdani42/nvim-web-devicons
  use "nvim-lualine/lualine.nvim"             -- Status line - https://github.com/nvim-lualine/lualine.nvim
  use "gcmt/taboo.vim"                        -- Pretty tabs - https://github.com/gcmt/taboo.vim

  -- TODO: check out: use "echasnovski/mini.nvim"                 -- "https://github.com/echasnovski/mini.nvim"

  -- use "sidebar-nvim/sidebar.nvim"             -- Modular sidebar - https://github.com/sidebar-nvim/sidebar.nvim
  use "moll/vim-bbye"                         -- 
  use "ahmedkhalf/project.nvim"               -- Project manager - https://github.com/ahmedkhalf/project.nvim
  use "lewis6991/impatient.nvim"              -- Cache lua modules - https://github.com/lewis6991/impatient.nvim
  use "lukas-reineke/indent-blankline.nvim"   -- Indentation guides - https://github.com/lukas-reineke/indent-blankline.nvim
  use "folke/which-key.nvim"                  -- Key binding menu - https://github.com/folke/which-key.nvim
  use "antoinemadec/FixCursorHold.nvim"       -- Fix lsp doc highlight - https://github.com/antoinemadec/FixCursorHold.nvim
  use "chentoast/marks.nvim"                  -- Marks - https://github.com/chentau/marks.nvim
  use "christoomey/vim-tmux-navigator"        -- Vim Tmux Navigator - https://github.com/christoomey/vim-tmux-navigator
  use "tyru/open-browser.vim"                 -- Open URI with browser - https://github.com/tyru/open-browser.vim/
  use "tpope/vim-surround"                    -- Quoting/parenthesizing - https://github.com/tpope/vim-surround
  -- use "terryma/vim-expand-region"             -- Select increasingly regions - https://github.com/terryma/vim-expand-region 
  -- Plug 'tpope/vim-fugitive'                                       " Git wrapper - https://github.com/tpope/vim-fugitive 
  -- Plug 'tpope/vim-dadbod'                                         " Interact with databases - https://github.com/tpope/vim-dadbod
  use "phaazon/hop.nvim"                      -- Easy motion - https://github.com/phaazon/hop.nvim
  use "svermeulen/vim-cutlass"                -- Adds 'cut' operation - https://github.com/svermeulen/vim-cutlass
  --[[ use "svermeulen/vim-yoink"                  -- Paste history - https://github.com/svermeulen/vim-yoink ]]
  use "svermeulen/vim-subversive"             -- Quick substitutions - https://github.com/svermeulen/vim-subversive
  use "norcalli/nvim-colorizer.lua"           -- Color highlighter - https://github.com/norcalli/nvim-colorizer.lua
  use "b0o/SchemaStore.nvim"                  -- JSON schemas catalog - https://github.com/b0o/SchemaStore.nvim

  use "jvgrootveld/telescope-zoxide"          -- Zoxie intergration - https://github.com/jvgrootveld/telescope-zoxide

  --[[ use "gbprod/yanky.nvim"                     -- Clipboard manager - https://github.com/gbprod/yanky.nvim ]]

  -- Colorschemes
  -- use "lunarvim/darkplus.nvim"                -- https://github.com/lunarvim/darkplus.nvim
  use "ishan9299/nvim-solarized-lua"          -- Solarized theme - https://github.com/ishan9299/nvim-solarized-lua
  -- use 'overcache/NeoSolarized'
  -- use 'lifepillar/vim-solarized8'

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                      -- The completion plugin - https://github.com/hrsh7th/nvim-cmp
  use "hrsh7th/cmp-buffer"                    -- Buffer completions - https://github.com/hrsh7th/cmp-buffer
  use "hrsh7th/cmp-path"                      -- Path completions - https://github.com/hrsh7th/cmp-path
  use "hrsh7th/cmp-cmdline"                   -- Cmdline completions - https://github.com/hrsh7th/cmp-cmdline
  use "hrsh7th/cmp-nvim-lsp"                  -- LSP completion - https://github.com/hrsh7th/cmp-nvim-lsp
  use "saadparwaiz1/cmp_luasnip"              -- Snippet completions - https://github.com/saadparwaiz1/cmp_luasnip

  -- snippets
  use "L3MON4D3/LuaSnip"                        -- Snippet engine - https://github.com/l3mon4d3/luasnip
  use "rafamadriz/friendly-snippets"            -- a bunch of snippets to use - https://github.com/rafamadriz/friendly-snippets

  -- LSP
  use "neovim/nvim-lspconfig"                   -- Enable LSP - https://github.com/neovim/nvim-lspconfig
  use "williamboman/nvim-lsp-installer"         -- LSP installer - https://github.com/williamboman/nvim-lsp-installer
  use "tamago324/nlsp-settings.nvim"            -- LSP settings in json - https://github.com/tamago324/nlsp-settings.nvim
  use "jose-elias-alvarez/null-ls.nvim"         -- For formatters and linters - https://github.com/jose-elias-alvarez/null-ls.nvim 
  use "jose-elias-alvarez/nvim-lsp-ts-utils"    -- TypeScript dev improvements - https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils

  use 'mfussenegger/nvim-dap'                   -- Debugger - https://github.com/mfussenegger/nvim-dap
  use 'theHamsta/nvim-dap-virtual-text'         -- Show variable definitions - https://github.com/theHamsta/nvim-dap-virtual-text

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',                              -- Highly extendable fuzzy finder - https://github.com/nvim-telescope/telescope.nvim
    requires = {
      { 'nvim-telescope/telescope-live-grep-args.nvim' }          -- live grep args pciker - https://github.com/nvim-telescope/telescope-live-grep-args.nvim
    }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
  use "nvim-telescope/telescope-dap.nvim"                         -- dap integration - https://github.com/nvim-telescope/telescope-dap.nvim

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }   -- https://github.com/nvim-treesitter/nvim-treesitter
  use "nvim-treesitter/nvim-tree-docs"                            -- Documentation generator - https://github.com/nvim-treesitter/nvim-tree-docs
  use "p00f/nvim-ts-rainbow"                                      -- Rainbow parentheses - https://github.com/p00f/nvim-ts-rainbow
  use "JoosepAlviste/nvim-ts-context-commentstring"               -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring


  -- Git
  use "lewis6991/gitsigns.nvim"                                   -- Git decorations - https://github.com/lewis6991/gitsigns.nvim
  use "whiteinge/diffconflicts"                                   -- Mergetool - https://github.com/whiteinge/diffconflicts


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
