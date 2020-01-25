
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_diagnosticsList  = 'Disabled'
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['/usr/local/bin/typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['/usr/local/bin/typescript-language-server', '--stdio'],
  \ 'typescript': ['/usr/local/bin/typescript-language-server', '--stdio'],
  \ 'typescript.tsx': ['/usr/local/bin/typescript-language-server', '--stdio'],
  \ }

let g:LanguageClient_hoverPreview='Never'
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
