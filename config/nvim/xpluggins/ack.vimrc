
" Search Tool - https://github.com/mileszs/ack.vim
" Use The Silver Searcher - https://github.com/ggreer/the_silver_searcher

if executable('ag') | let g:ackprg = 'ag --vimgrep' | endif
let g:ackhighlight = 1
nnoremap <Leader>f :Ack<Space>
