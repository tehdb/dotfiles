set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"=== basic ====================================================================
  set nocompatible
  syntax on
  " language en_US
  filetype plugin on
  filetype indent on
  set encoding=utf-8
  set t_CO=256			                  " use 256 bit colors
  set shell=/usr/local/bin/zsh
  set foldmethod=syntax
  set foldlevel=777
  set autoindent                      " turns it on
  set smartindent                     " does the right thing (mostly) in programs
  " set visualbell t_vb=    " turn off error beep/flash
  " set novisualbell        " turn off visual bell
  "
  set noerrorbells visualbell t_vb=
  autocmd GUIEnter * set visualbell t_vb=

  " Use a blinking upright bar cursor in Insert mode, a blinking block in normal
  " if &term == 'xterm-256color' || &term == 'screen-256color'
  "   let &t_SI = '\<Esc>[5 q'
  "   let &t_EI = '\<Esc>[1 q'
  " endif
  "
  " if exists('$TMUX')
  "   let &t_EI = '\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\'
  "   let &t_SI = '\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\'
  " endif
"===================================================================== basic ===


"=== plugins ===================================================================
  call plug#begin('~/.vim/plugged')

    " File searcher - https://github.com/ctrlpvim/ctrlp.vim
    Plug 'ctrlpvim/ctrlp.vim'

    " File explorer sidebar - https://github.com/scrooloose/nerdtree
    Plug 'scrooloose/nerdtree'

    " Intensely orgasmic commenting - https://github.com/scrooloose/nerdcommenter
    Plug 'scrooloose/nerdcommenter'

    " Fast navigation - https://github.com/easymotion/vim-easymotion
    Plug 'easymotion/vim-easymotion'

    " Text alignment plugin - https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " Brackets, parens, quotes in pair - https://github.com/jiangmiao/auto-pairs
    " Plug 'jiangmiao/auto-pairs'

    " Buffer explorer - https://github.com/jlanzarotta/bufexplorer
    Plug 'jlanzarotta/bufexplorer'

    " Code formatter - https://github.com/prettier/vim-prettier
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

    " Select increasingly regions - https://github.com/terryma/vim-expand-region
    Plug 'terryma/vim-expand-region'

    " Git wrapper - https://github.com/tpope/vim-fugitive
    Plug 'tpope/vim-fugitive'

    " Quoting/parenthesizing - https://github.com/tpope/vim-surround
    Plug 'tpope/vim-surround'

    " File browser - https://github.com/tpope/vim-vinegar
    Plug 'tpope/vim-vinegar'

    " Expanding abbreviations - https://github.com/mattn/emmet-vim
    " Plug 'mattn/emmet-vim'

    " Move lines/selections up/down - https://github.com/matze/vim-move
    Plug 'matze/vim-move'

    " Highlighting colors - https://github.com/chrisbra/Colorizer
    Plug 'chrisbra/Colorizer'

    " Navigation between tmux and vim - https://github.com/christoomey/vim-tmux-navigator
    Plug 'christoomey/vim-tmux-navigator'

    " Git diff in the gutter - https://github.com/airblade/vim-gitgutter
    " Plug 'airblade/vim-gitgutter'

    " Dash integration - https://github.com/rizzatti/dash.vim
    Plug 'rizzatti/dash.vim'

    " Search tool - https://github.com/mileszs/ack.vim
    Plug 'mileszs/ack.vim'

    " Mergetool - https://github.com/whiteinge/diffconflicts
    Plug 'whiteinge/diffconflicts'

    " Draw tables - https://github.com/dhruvasagar/vim-table-mode
    Plug 'dhruvasagar/vim-table-mode'

    " TypeScript Syntax Highlighting - https://github.com/HerringtonDarkholme/yats.vim
    Plug 'HerringtonDarkholme/yats.vim'

    " TypeScript auto-complete - https://github.com/mhartington/nvim-typescript
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

    " Completion framework - https://github.com/Shougo/deoplete.nvim
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

    " Autocomplete for english - https://github.com/ujihisa/neco-look
    Plug 'ujihisa/neco-look'

    " Generic fuzzy finder - https://github.com/Shougo/denite.nvim
    Plug 'Shougo/denite.nvim'

    " Interactive command execution - https://github.com/Shougo/vimproc.vim
    Plug 'Shougo/vimproc.vim'

    " Collection of language packs - https://github.com/sheerun/vim-polyglot
    Plug 'sheerun/vim-polyglot'

    " Snippet support - https://github.com/Shougo/neosnippet.vim
    "                 - https://github.com/Shougo/neosnippet-snippets
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'                             "|

    " Syntax checking - https://github.com/vim-syntastic/syntastic
    Plug 'vim-syntastic/syntastic'

    " Symbols / definitions for current file - https://github.com/majutsushi/tagbar
    " Plug 'majutsushi/tagbar'

    " Tagbar and NERDTree - https://github.com/pseewald/nerdtree-tagbar-combined
    " Plug 'pseewald/nerdtree-tagbar-combined'

    " File explorer - https://github.com/Shougo/defx.nvim
    " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }     "|

    " Asynchronous linting - https://github.com/w0rp/ale
    Plug 'w0rp/ale'

    " Material theme - https://github.com/kaicataldo/material.vim
    " Plug 'kaicataldo/material.vim'

    " Material theme - https://github.com/hzchirs/vim-material
    " Plug 'hzchirs/vim-material'
    "
    " Material theme - https://github.com/kristijanhusak/vim-hybrid-material
    Plug 'kristijanhusak/vim-hybrid-material'

    " Status / tabline - https://github.com/vim-airline/vim-airline
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

    " Status line - https://github.com/itchyny/lightline.vim
    Plug 'itchyny/lightline.vim'

    " Buffer line - https://github.com/mengelbrecht/lightline-bufferline
    " Plug 'mengelbrecht/lightline-bufferline'
    " Plug 'bling/vim-bufferline'

    " Buffer-/Tabline - https://github.com/ap/vim-buftabline
    " Plug 'ap/vim-buftabline'
    Plug 'mkitt/tabline.vim'

    " Glyphs / icons - https://github.com/ryanoasis/vim-devicons
    " Plug 'ryanoasis/vim-devicons'

    " Colors for icons - https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " Dim inactive windows - https://github.com/blueyed/vim-diminactive
    Plug 'blueyed/vim-diminactive'

    " Foldings
    Plug 'konfekt/fastfold'
    Plug 'tmhedberg/SimpylFold'

  call plug#end()
"=================================================================== plugins ===


"=== settings ==================================================================
  if (has("termguicolors")) | set termguicolors | endif

  " set background=dark
  " let g:material_style='oceanic'
  set background=dark
  " colorscheme material
  " colorscheme vim-material
  colorscheme hybrid_reverse
  hi Normal guibg=#121212

  let mapleader = ','                 " set default leader to comma
  set backspace=indent,eol,start      " make backspace behave like every other editor
  set nonumber                        " line numbers
  set hlsearch                        " enable search highlighting
  set incsearch                       " enable highlighting the first search match
  set nowrap                          " disable line break
  set formatoptions-=t
  set tabstop=2                       " width of tab character
  set softtabstop=2                   " fine tunes the amount of white space to be added
  set shiftwidth=2                    " determines the amount of whitespace to add in normal mode
  set expandtab                       " When on uses space instead of tabs
  set fileformat=unix
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set foldcolumn=2
  set scrolloff=10                    " Number of screen lines to keep above and below the cursor
  set signcolumn=yes                  " Allways show Sign Column
  set guifont=Hack_Nerd_Font:h13      " Use custom font with powerline support
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Exluding version control directories
  set listchars=space:·,tab:>-,trail:·,extends:↴,precedes:↳,eol:↲
  set showbreak=↳
  set linebreak
  set hidden                          " Render
  set timeoutlen=1000 ttimeoutlen=0   " Eliminating delays on ESC
  " set linespace=4

  let $VTE_VERSION="100"
  " Left gap
  hi FoldColumn term=standout ctermfg=4 ctermbg=bg guifg=#6C6C6C guibg=bg
  hi Folded guibg=bg guifg=#6C6C6C ctermbg=bg

  " Highlighting search matches
  hi Search guibg=#FF5D5C guifg=#212022

  " Highlighting braces
  hi MatchParen guifg=#D7D780 guibg=#212022
  hi MatchParen ctermfg=red ctermbg=red cterm=NONE

  " set guicursor=n-v-c:block-Cursor/lCursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  "
  " set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,
  " set guicursor=n:blinkon1
  "
  " set guicursor=
  " hi Cursor guifg=green guibg=green
  " hi Cursor2 guifg=red guibg=red
  " set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
"================================================================= settings ===

"=== auto-commands =============================================================
  " Remove trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " Auto source vim config
  augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
  augroup END
"============================================================= auto-commands ===

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

source ~/.config/nvim/plugins.vimrc
source ~/.config/nvim/mappings.vimrc


