" Disable default mappings
let g:nnn#set_default_mappings = 0

" Then set your own
nnoremap <silent> <leader>nn :NnnPicker<CR>


" Or override
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>


" Floating window (neovim)
function! s:layout()
  let buf = nvim_create_buf(v:false, v:true)

  let height = &lines - (float2nr(&lines / 3))
  let width = float2nr(&columns - (&columns * 2 / 3))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 2,
        \ 'col': 8,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
let g:nnn#layout = 'call ' . string(function('<SID>layout')) . '()'
