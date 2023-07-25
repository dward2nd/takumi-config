" A function to determine whether the pair of enclosing char should be deleted
function DeleteEnclosing(linestr, curpos, beforecurpos, key, directionKey)
    let pairs = ["{}" ,"()", "[]", "\"\"", "''", "``"]
    
    for pair in pairs
        if strpart(a:linestr, a:beforecurpos, 1) == pair[0] &&
                    \ strpart(a:linestr, a:curpos, 1) == pair[1]
            return a:directionKey . a:key . a:key
        endif
    endfor
    return a:key
endfunction

" Automatically enclose the bracelets, brackets, parentheses, quotes.
inoremap        {         {}<Left>
inoremap        {{        {
inoremap        {<CR>     {<CR>}<Esc>O
inoremap <expr> }         strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap        (         ()<Left>
inoremap        ((        (
inoremap        (<CR>     (<CR>)<Esc>O
inoremap <expr> )         strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [         []<Left>
inoremap        [[        [
inoremap        [<CR>     [<CR>]<Esc>O
inoremap <expr> ]         strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> "         strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap        ""        "
inoremap        "<CR>     "<CR>"<Esc>O
inoremap <expr> """       strpart(getline('.'), col('.')-1, 3) == "\"\"\"" ? "\<Right>\<Right>\<Right>" : "\"\"\"\"\"\"\<Left>\<Left>\<Left>"
inoremap        """<CR>   """<CR>"""<Esc>O
inoremap        ''        '
inoremap <expr> '         strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap        '<CR>     '<CR>'<Esc>O
inoremap <expr> '''       strpart(getline('.'), col('.')-1, 3) == "\'\'\'" ? "\<Right>\<Right>\<Right>" : "\'\'\'\'\'\'\<Left>\<Left>\<Left>"
inoremap        '''<CR>   '''<CR>'''<Esc>O
inoremap <expr> `         strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "``\<Left>"
inoremap        `<CR>     `<CR>`<Esc>O
inoremap <expr> ```       strpart(getline('.'), col('.')-1, 3) == "```" ? "\<Right>\<Right>\<Right>" : "``````\<Left>\<Left>\<Left>"
inoremap        ```<CR>   ```<CR>```<Esc>O
inoremap /*               /**/<Left><Left>
inoremap /*<Space>        /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>           /*<CR>*/<Esc>O
inoremap <expr> <BS>       DeleteEnclosing(getline('.'), col('.') - 1, col('.') - 2, "\<BS>", "\<Right>")
inoremap <expr> <Del>      DeleteEnclosing(getline('.'), col('.') - 1, col('.') - 2, "\<Del>", "\<Left>")
inoremap <expr> <C-w>      DeleteEnclosing(getline('.'), col('.') - 1, col('.') - 2, "\<C-w>", "\<Right>")

" ===== Others ======

" copy and paste in visual mode using standard ctrl-c ctrl-v keys
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Use <ESC> to exit the terminal mode
tnoremap <Esc> <C-\><C-n>

" My preferred key-mapping to navigate between windows.
" note:
" - ˙ is option + h
" - ¬ is option + l
" - ˚ is option + k 
" - ∆ is option + j
tnoremap ˙ <C-\><C-N><C-w>h
tnoremap ∆ <C-\><C-N><C-w>j
tnoremap ˚ <C-\><C-N><C-w>k
tnoremap ¬ <C-\><C-N><C-w>l
inoremap ˙ <C-\><C-N><C-w>h
inoremap ∆ <C-\><C-N><C-w>j
inoremap ˚ <C-\><C-N><C-w>k
inoremap ¬ <C-\><C-N><C-w>l
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" Quick key to switch between buffers.
"nnoremap <C-h> :bp<CR>
"nnoremap <C-l> :bn<CR>

" quite using J followed by K to exit insert mode
inoremap jk <Esc>    
tnoremap jk <Esc>    
