
let g:yoinkIncludeDeleteOperations = 1

" yank history will be saved persistently across sessions
let g:yoinkSavePersistently = 1

nmap <C-i> <plug>(YoinkPostPasteSwapBack)
nmap <C-u> <plug>(YoinkPostPasteSwapForward)

nmap <Leader>yy :Yanks<CR>
nmap <Leader>yc :ClearYanks<CR>

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

