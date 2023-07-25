" ##### Nerdtree #####
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
" Automatically open NERDTree if no files are specified during nvim execution
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | set signcolumn=number | wincmd w | endif
" Set the Nerdtree to automatically close when only Nerdtree's tab left in the
" buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Make Nerdtree to be more minimal
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
" Set the default size of nerdtree
let g:NERDTreeWinSize = 26
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1

" Show hidden files
let g:NERDTreeShowHidden = 1
