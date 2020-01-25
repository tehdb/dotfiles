
" code syntax overview
" https://github.com/jb55/typescript-ctags
" https://github.com/majutsushi/tagbar/wiki#exuberant-ctags-vanilla
" nmap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>T :TagbarToggle<CR>
nnoremap <Leader>t 1<C-w><C-w><CR>

let g:tagbar_left = 1
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
