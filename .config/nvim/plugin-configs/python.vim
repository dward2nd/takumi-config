" ##### isort #####
let g:vim_isort_python_version = 'python'
let g:isort_vim_options = '--line-length 79 --profile=black'

" Run black, isort, flake8 after saving a file
autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.py execute ':Isort'
autocmd BufWritePre *.py call flake8#Flake8()
