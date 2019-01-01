
" nmap - mapping for normal mode
" vmap - mapping for visual mode
nmap <Leader><space> :nohlsearch<CR>
nmap <Leader>ev :tabedit ~/.config/nvim/init.vim<CR>
nmap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR>

nmap <Leader>h :split<CR>
nmap <Leader>v :vsplit<CR>

map <Leader>l <Plug>(expand_region_expand)
map <Leader>h <Plug>(expand_region_shrink)

" switch between tabs
nnoremap <Leader>t :bnext<CR>
nnoremap <Leader>T :bprev<CR>

" split management
set splitbelow                                    " open vertical split below
set splitright                                  " open horizontal split right
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" disable arrow keys
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

nmap <Leader>n :NERDTreeToggle<CR>
" nmap <Leader>n :ToggleNERDTreeAndTagbar<CR>
nmap <Leader>N :NERDTreeFind<CR>


" CtrlP

" quote
" :nnoremap <Leader>q" ciw""<Esc>P
" :nnoremap <Leader>q' ciw''<Esc>P

" delete current buffer
nmap <Leader>d :bdelete<CR>

" write current buffer
nmap <Leader>w :write<CR>

" close vim
nmap <Leader>q :qa<CR>
