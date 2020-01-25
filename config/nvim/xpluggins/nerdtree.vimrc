" Sidebar File Explorer - https://github.com/scrooloose/nerdtree

let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeBookmarksSort=0
let g:NERDTreeShowBookmarks=0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"

" open automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeFocus<CR>
" nmap <Leader>n :ToggleNERDTreeAndTagbar<CR>
nmap <Leader>N :NERDTreeFind<CR>


let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='h'
