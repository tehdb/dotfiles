"=== CtrlP =====================================================================
  " File searcher
  " https://github.com/ctrlpvim/ctrlp.vim

  let g:ctrlp_cmd = 'CtrlPCurWD'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_working_path_mode = 'rw'
  let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:30'
  let g:ctrlp_custom_ignore = { 'dir':  '\.git$\|\.hg$\|\.svn$\|\.idea$\|\.vcode$\|bower_components$\|node_modules$\|target$\|dist$\|vendors$\|\.build$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$\|\.ai$\|\.bmp$\|\.gif$\|\.hqx$\|\.icns$\|\.ico$\|\.jpeg$\|\.jpg$\|\.png$\|\.psd$\|\.tif$\|\.tiff$'}
"===================================================================== CtrlP ===


"=== NERDTree ==================================================================
  " File explorer sidebar
  " https://github.com/scrooloose/nerdtree


  let g:NERDTreeWinSize=50
  let g:NERDTreeAutoDeleteBuffer = 1

  " open automatically when vim starts up if no files were specified
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


  " open NERDTree automatically when vim starts up on opening a directory
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


  " close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"================================================================== NERDTree ===


"=== NERDCommenter =============================================================
  " Intensely orgasmic commenting
  " https://github.com/scrooloose/nerdcommenter

  let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
  let g:NERDCommentWholeLinesInVMode=1
  let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
  let g:NERDDefaultAlign = 'both'         " Align line-wise comment delimiters flush left instead of foll
  let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when comment
  let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTreeChDirMode = 2
"============================================================= NERDCommenter ===


"=== vim-move ==================================================================
  " Move lines/selections up/down
  " https://github.com/matze/vim-move

  let g:move_map_keys = 0
  vmap <Leader>j <Plug>MoveBlockDown
  vmap <Leader>k <Plug>MoveBlockUp
"================================================================== vim-move ===


"=== ack =======================================================================
  " Search tool
  " https://github.com/mileszs/ack.vim

  " Use The Silver Searcher - https://github.com/ggreer/the_silver_searcher
  if executable('ag') | let g:ackprg = 'ag --vimgrep' | endif
  let g:ackhighlight = 1
  nnoremap <Leader>f :Ack<Space>
"======================================================================= ack ===


"=== deoplete ==================================================================
  " Completion framework
  " https://github.com/Shougo/deoplete.nvim
  let g:deoplete#enable_at_startup = 1
  let g:node_host_prog = '/usr/local/bin/neovim-node-host'
  let g:nvim_typescript#diagnostics_enable = 0
"================================================================== deoplete ===


"=== vim-table-mode ============================================================
  " VIM Table Mode for instant table creation
  " https://github.com/dhruvasagar/vim-table-mode

  " Markdown-compatible tables
  let g:table_mode_corner='|'
"============================================================ vim-table-mode ===

"=== vim-polyglot ==============================================================
  " Collection of language packs
  " https://github.com/sheerun/vim-polyglot

  " let g:polyglot_disabled = ['ts', 'tsx']
"=============================================================== vim-polyglot ===


"=== vim-syntastic ==============================================================
  " Syntax checking
  " https://github.com/vim-syntastic/syntastic

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  " TODO: make syntastic fly for gk custom tags
  " let g:syntastic_html_tidy_ignore_errors=["<gk-", "discarding unexpected </gk-", " proprietary attribute \"gk-"]
  " Set up the arrays to ignore for later
  if !exists('g:syntastic_html_tidy_ignore_errors') | let g:syntastic_html_tidy_ignore_errors = [] | endif
  " Ignore gk tags in HTML syntax checking
  let g:syntastic_html_tidy_ignore_errors += ["<gk-", "discarding unexpected </gk-", "plain text isn't allowed in <head> elements"]

  " Ignore ionic tags in HTML syntax checking, See http://stackoverflow.com/questions/30366621
  let g:syntastic_html_tidy_ignore_errors += ["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

  let g:syntastic_ignore_files = ['index\.html']
  " let g:syntastic_filetype_checkers['xml'] = []
  let g:syntastic_xml_checkers = []
  let g:syntastic_hbs_checkers = []
  " let g:syntastic_xml_plutil_quiet_messages = []
  " let g:syntastic_xml_xmllint_quiet_messages = []
  " let g:syntastic_disabled_filetypes = ['xml']
  " let g:syntastic_xml_checkers=[''];
"============================================================== vim-syntastic ===


"=== ale ========================================================================
  " Asynchronous linting
  " https://github.com/w0rp/ale

  let b:ale_linters = ['eslint', 'tslint']
  let g:ale_sign_error = '>'
  let g:ale_sign_warning = '-'
"======================================================================== ale ===


"=== material ===================================================================
  " Material theme
  " https://github.com/kaicataldo/material.vim

  " let g:material_theme_style='dark'
  " let g:terminal_color_background='#121212'
"=================================================================== material ===


"=== vim-airline ================================================================
  " Status / tabline
  " https://github.com/vim-airline/vim-airline

  " let g:airline_theme='material'
  let g:airline_theme = "hybridline"
  let g:smartusline_string_to_highlight = '(%n) %f '
  set laststatus=2 " always show status line
  set showtabline=2 " always show tabline
  set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it
  " set showmode                           " Show current mode in the status line
  set showcmd                             " Show the command in the status line

  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tab_type = 1
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#branch#enabled=1
  let g:airline#extensions#syntastic#enabled=1

  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  " let g:airline#extensions#tabline#formatter = 'jsformatter'
  let g:airline_section_z = '%3l/%L:%3v'

"================================================================ vim-airline ===

"=== lightline /  bufferline ====================================================

  let g:buftabline_indicators = 'on'
  " let g:buftabline_numbers = 1

  let g:lightline = { }
  " let g:lightline#bufferline#show_number  = 1
  " let g:lightline#bufferline#shorten_path = 0
  " let g:lightline#bufferline#unnamed      = '[No Name]'
  " let g:lightline#bufferline#filename_modifier = ':t'
  "
  " let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
  " let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
  " let g:lightline.component_type   = {'buffers': 'tabsel'}

"==================================================== lightline /  bufferline ===

"=== vim-devicons ===============================================================
  let g:webdevicons_enable_nerdtree = 1
  let g:webdevicons_enable_airline_tabline = 1
  let g:webdevicons_conceal_nerdtree_brackets = 1
"=============================================================== vim-devicons ===


"=== tagbar =====================================================================
" https://github.com/jb55/typescript-ctags
" https://github.com/majutsushi/tagbar/wiki#exuberant-ctags-vanilla
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
"===================================================================== tagbar ===

