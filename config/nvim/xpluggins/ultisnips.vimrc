
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=["xsnippets"]
let g:UltiSnipsExpandTrigger="<c-S>"         " <tab> is used cuz coc-ultisnips

nmap <Leader>sn :call UltiSnips#JumpForwards()<CR>
nmap <Leader>sp :call UltiSnips#JumpBackwards()<CR>
nmap <Leader>sl :call UltiSnips#ListSnippets()<CR>
nmap <Leader>se :UltiSnipsEdit<CR>
