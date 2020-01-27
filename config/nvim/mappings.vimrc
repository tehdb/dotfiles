" nmap - mapping for normal mode
" vmap - mapping for visual mode
nmap <Leader><space> :nohlsearch<CR>
nmap <Leader>ev :tabedit ~/.config/nvim/init.vim<CR>
" nmap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>


nmap <Leader>h :split<CR>
nmap <Leader>v :vsplit<CR>

map <Leader>e <Plug>(expand_region_expand)
map <Leader>E <Plug>(expand_region_shrink)

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Open link under cursor
nmap <Leader>o <Plug>(openbrowser-open)

" Show current file path
map <Leader>fp :echo expand('%:p')<CR>

" format source
" nmap <Leader>P :Prettier<CR>

" close current tab
nmap <Leader>tc :tabclose<CR>

" split management
set splitbelow                          " open vertical split below
set splitright                          " open horizontal split right
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" disable arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

let s:OSName = system("uname -s")
if s:OSName == "Darwin\n"
  " OSX
  " set clipboard=unnamed
  vnoremap <Leader>c "*y
elseif s:OSName == "Linux\n"
  " Linux
  " set clipboard=unnamedplus
  vnoremap <Leader>c "+y
endif

" delete current buffer
nmap <Leader>d :bdelete<CR>

" write current buffer
" nmap <Leader>w :write<CR>

" close vim
" nmap <Leader>q :qa!<CR>

" reload file
nmap <Leader>u :e!<CR>

" relead all buffers
nmap <Leader>U :bufdo e<CR>

" search selected text
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
