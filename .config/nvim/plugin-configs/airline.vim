" Replace utf-8[unix] with something else
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Disable the statusline in the tabline
"let g:airline_statusline_ontop = 1

" Display a short path in statusline
let g:airline_stl_path_style = 'short'

" ##### vimairline #####
" Enable the tab bar.
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Show the tab number on the right of the tabs name.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1 
let g:airline#extensions#tabline#show_tabs = 0 
let g:airline_powerline_fonts = 1
" enable/disable displaying open splits per tab (only when tabs are opened).
let g:airline#extensions#tabline#show_splits = 1 
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

" tab number
let g:airline#extensions#tabline#tab_nr_type = 3 
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tmuxline#enabled = 1

let g:airline_theme = 'dracula'

" set default theme to dracula
colorscheme dracula

" Remove the background to to make it transparent.
hi Normal guibg=NONE ctermbg=NONE

