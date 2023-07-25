" ***** Plugin section *****
call plug#begin("~/.vim/plugged")

" Python code formatter
" Installing Colorizer, the color code (like #00FF00 or green) highlighting.
Plug 'chrisbra/Colorizer'
" install Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Install black plugin, Python code formatter in Black style.
Plug 'psf/black'
" install isort, sorting Python import statement lexicologically.
Plug 'brentyi/isort.vim'
" Install flake8 plugin, Python code standard detection to make our code
" flawless.
Plug 'nvie/vim-flake8'
" Installing nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'  " git integrations
Plug 'ryanoasis/vim-devicons'
" Installing Fern, NERDTree alternative
Plug 'antoinemadec/FixCursorHold.nvim'
" Vim plugin for CMake generator
Plug 'cdelledonne/vim-cmake'
" plugin for status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Enable virtualenv support for vimairline
Plug 'jmcantrell/vim-virtualenv'
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
" C++ syntax highlighter based on LSP
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

" ***** Import plugin settings *****
runtime! ./plugin-configs/*.vim

