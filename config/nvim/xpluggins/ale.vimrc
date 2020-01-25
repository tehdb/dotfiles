
" Asynchronous linting - https://github.com/w0rp/ale

let b:ale_linters = ['eslint', 'tslint']
let g:ale_sign_error = '*'
let g:ale_sign_warning = '!'
" Do not lint or fix minified files.
let g:ale_pattern_options = {
  \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.d\.ts$': {'ale_linters': [], 'ale_fixers': []},
  \ '\.map$': {'ale_linters': [], 'ale_fixers': []},
  \ }
  " If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1


nmap <Leader>ln :ALENext<CR>
nmap <Leader>lp :ALEPrevious<CR>
