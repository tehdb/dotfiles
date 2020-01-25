
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Auto source vim config
augroup autosourcing
  autocmd!
  autocmd BufWritePost $MYVIMRC source %
augroup END

" clear registers on start
" command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
" autocmd VimEnter * WipeReg

autocmd Filetype * AnyFoldActivate               " activate folding for all filetypes

" JSX filetype should be javascript.jsx and TSX filetype to be typescript.jsx or
" typescript.tsx. In coc.nvim, these filetypes are mapped to javascriptreact and
" typescriptreact - see https://github.com/neoclide/coc-tsserver

au BufNewFile,BufRead *.js setlocal filetype=javascript
au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
