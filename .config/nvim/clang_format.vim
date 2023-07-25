" enable keymap for clang-format
map <C-K> :pyf /usr/local/bin/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/bin/clang-format.py<cr>

function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()

function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/llvm/tools/clang/tools/clang-format/clang-format.py
endfunction

"autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

