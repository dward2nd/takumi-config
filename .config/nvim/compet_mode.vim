command! -nargs=0 CompetMode
    \ :call EnableCompetitiveMode()

command! -nargs=0 ExitCompetMode
    \ :call ExitCompetMode()

function! EnableCompetitiveMode()
  wincmd v
  wincmd s
  wincmd l
  17 wincmd < 
  wincmd s
  wincmd j
  term
  wincmd k
  e input.txt
  wincmd v
  wincmd l
  e output.txt
  2 wincmd h
endfunction

function! ExitCompetMode()
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
  q!
endfunction
