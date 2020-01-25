" IntelliSense engine - https://github.com/neoclide/coc.nvim

" coc config
" https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-ultisnips',
  \ 'coc-yaml',
  \ 'coc-yank',
  \ ]

  " \ 'coc-eslint',
" coc-sources - https://github.com/neoclide/coc-sources
" coc-lists - https://github.com/neoclide/coc-lists
" coc-jest - https://github.com/neoclide/coc-jest
" todoapp - https://github.com/neoclide/todoapp.vim

nmap <silent> <Leader>lL <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>ll <Plug>(coc-diagnostic-next)

nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gt <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Show documentation in preview window
nnoremap <silent> <Leader>D :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <Leader>R <Plug>(coc-rename)

" coc-prettier - https://github.com/neoclide/coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <Leader>p :Prettier<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
