" Using floating windows of Neovim to start fzf

" nmap <Leader>f :Ag<Space>
nmap <c-f> :Ag<Space><CR>
nmap <c-p> :Files<CR>
nmap <c-t> :Tags<CR>
nmap <c-b> :Buffers<CR>

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
    setlocal
      \ buftype=nofile
      \ nobuflisted
      \ bufhidden=hide
      \ nonumber
      \ norelativenumber
      \ signcolumn=no
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
