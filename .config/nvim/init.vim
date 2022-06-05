" ***** Plugin section *****
call plug#begin("~/.vim/plugged")

" Python code formatter
" Installing Colorizer, the color code (like #00FF00 or green) highlighting.
Plug 'chrisbra/Colorizer'
" install Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Install black plugin, Python code formatter in Black style.
Plug 'psf/black', {'branch': 'stable'}
" install isort, sorting Python import statement lexicologically.
Plug 'brentyi/isort.vim'
" Install flake8 plugin, Python code standard detection to make our code
" flawless.
Plug 'nvie/vim-flake8'
" Installing nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'  " git integrations
Plug 'ryanoasis/vim-devicons'
" plugin for status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" plugin to show git branch on the status bar
Plug 'itchyny/vim-gitbranch'
" installing signify, where the file changes in git repo
Plug 'mhinz/vim-signify'
" Make git-compatible
Plug 'tpope/vim-fugitive'
" Syntax highilghter plugin
Plug 'sheerun/vim-polyglot'
" Code completion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf, (f)u(z)zy (f)inder; command-line base file manager plugin
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" emmet, write HTML easier
Plug 'mattn/emmet-vim'

call plug#end()

" ***** Config Section *****
"
" signify config
let g:signify_sign_show_count = 1
let g:signify_line_highlight = 0
let g:signify_number_highlight = 1
let g:signify_difftool = 'gnudiff'
let g:signify_sign_add               = '✚'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '✹'
"
" ##### isort #####
let g:vim_isort_python_version = 'python'
let g:isort_vim_options = '--line-length 79 --profile=black'

" Run black, isort, flake8 after saving a file
autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.py execute ':Isort'
autocmd BufWritePre *.py call flake8#Flake8()


" Force running prettify
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

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
"enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_splits = 1 
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" tab number
let g:airline#extensions#tabline#tab_nr_type = 3 
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0

" ##### set default theme to dracula #####
let g:airline_theme = 'dracula'
colorscheme dracula

" ##### emmet-vim setting ##### 
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

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

" Enable color code highlighting.
let g:colorizer_auto_color = 1
" Enable highlighting color name.
let g:colorizer_colornames = 1

" ***** fzf *****
" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" ##### Basic Config #####

" Don't show the vim's current mode.
set noshowmode

" Show line numbers relatively to the current cursor
" where the current line would show the absolute line number instead.
set number relativenumber

" Syntax highlighting
syntax enable

" Show the command I'm typing.
set showcmd

" Set the default encoding to UTF-8
set encoding=utf-8

" Hidden a message to write a file before move to another buffer.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ##### Indentation #####

" Indent based on the syntax currently editing.
set smartindent

" The number of spaces to print when pressing Tab key.
set tabstop=4

" The number of characters to indent.
set shiftwidth=4
" Turning tab into a space automatically
set expandtab

" How many space each tab will turn into
set softtabstop=4

" ====== Appearance ======

" Add true color support for nvim in tmux
set termguicolors

" Show a cursor line on a line I'm typing in.
set cursorline

" Wrap the line automatically.
set wrap

" Break a lines using specified characters only (such as space, hyphen or others)
set linebreak

" Whether to display a status bar.
" - 0: No display
" - 1: Display only in multi-window
" - 2: Display
set laststatus=2

" Show the current position of the cursor.
set ruler

" Remove line number in terminal mode
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=number

" Set the default nvim theme to Dracula
colorscheme dracula

" Set signcolumn so that the git signal doesn't interfere with line numbers.
set signcolumn=yes

" ====== Search ======

" Highlight the corresponding parenthesis.
set showmatch

" Highlight the match when searching
set hlsearch

" Each time when enter a character in search, jump to the first match automatically.
set incsearch

" Ignore case when searching
set ignorecase

" ====== Edit ======

" Turn on the spell checking for English words.
"set spell spelllang=en_us

" Don't make any noise when an error occurs.
set errorbells
set belloff=hangul

" When error occurs, a visual cue will be given.
"set visualbell

" Monitoring files automatically, it will be prompting
" If any external changes happened to the file during
" editing.
set autoread

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

" ====== History & Backup ======

" Don't backup my previous edit.
set nobackup

" Automatically change the directory of working files in the same vim session.
set autochdir

" Warning if my code is longer than 80 characters.
set colorcolumn=80,120

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

" never resize other windows equally if a window is closed.
set noequalalways

" =========== coc config ===========
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif
"
" Disabled because it interfere with signify plugin

" Map for document filetypes for tsserver
let g:coc_filetype_map = {
    \ 'js': 'jsx',
    \ 'ts': 'tsx'
    \ }

command! -nargs=0 Tsc
    \ :call CocAction('runCommand', 'tsserver.watchBuild')

command! -nargs=0 OrganizeImport
    \ :call CocActionAsync('runCommand', 'tsserver.organizeImports')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" coc.nvim preferences
" set the rootPatterns to how Python environment can be detected.
call coc#config('coc.preferences', {
            \ 'rootPatterns': [".git", ".hg", ".projections.json", "package.json"]
            \})
