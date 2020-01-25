" File searcher - https://github.com/ctrlpvim/ctrlp.vim

let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:30'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '
            \ \.git$\|
            \ \.hg$\|
            \ \.svn$\|
            \ \.idea$\|
            \ \.vcode$\|
            \ \.rpt2_cache$\|
            \ \.stencil$\|
            \ \.build$\|
            \ \.temp$\|
            \ bower_components$\|
            \ node_modules$\|
            \ npm-packages-offline-cache$\|
            \ target$\|
            \ dist$\|
            \ loader$\|
            \ vendors$\|
            \ coverage$\|
            \ reports$\|
            \ www$
            \',
  \ 'file': '
            \.DS_Store
            \ \.exe$\|
            \ \.so$\|
            \ \.dll$\|
            \ \.pyc$\|
            \ \.ai$\|
            \ \.bmp$\|
            \ \.gif$\|
            \ \.hqx$\|
            \ \.icns$\|
            \ \.ico$\|
            \ \.jpeg$\|
            \ \.jpg$\|
            \ \.png$\|
            \ \.psd$\|
            \ \.tif$\|
            \ \.tiff$\|
            \ \.log$\|
            \ \.crt$\|
            \ \.pem$\|
            \ \.p12$\|
            \ \.jar$\|
            \ \.js.map$\|
            \ \.ts.map$\|
            \ \.d.ts$\|
            \ \.css.map$\|
            \ yarn.lock\|
            \ package-lock.json\|
      \'}

nnoremap <C-t> :CtrlPTag<CR>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
