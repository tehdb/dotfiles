
" Completion framework - https://github.com/Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
  \ 'auto_complete_delay': 500,
  \ 'smart_case': v:true,
  \ 'max_list': 10,
  \ 'prev_completion_mode': 'mirror'
  \ })
