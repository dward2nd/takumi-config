" signify config
let g:signify_sign_show_count = 1
let g:signify_line_highlight = 0
let g:signify_number_highlight = 1
let g:signify_difftool = 'gnudiff'
let g:signify_sign_add = '✚'
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change = '✹'

" set update time to 100 ms for better performance
" default updatetime 4000ms is not good for async update
set updatetime=100

