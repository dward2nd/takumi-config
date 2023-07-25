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

" Enable mouse
set mouse=a

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

" ====== History & Backup ======

" Don't backup my previous edit.
set nobackup

" Automatically change the directory of working files in the same vim session.
set autochdir

" Warning if my code is longer than 79 or 120 characters.
set colorcolumn=79,120

" never resize other windows equally if a window is closed.
set noequalalways
