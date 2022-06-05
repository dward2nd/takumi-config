#export TERM="xterm-256color"
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# set BAT_THEME to dracula 
export BAT_THEME="Dracula"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="/usr/local/opt/ruby/bin:$PATH"

# replace ls with exa
TREE_IGNORE="cache|log|logs|node_modules|vendor"

# Python settings
# prioritize Homebrew Python over the system default.
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
# load pyenv
eval "$(pyenv init -)"
# load virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export WORKON_HOME=$HOME/.virtualenvs
pyenv virtualenvwrapper_lazy

# FZF
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# it's very important to preserve `ls` for the sake of system-compatibility,
# so no icons are allowed
alias ls=' exa --group-directories-first'
alias li=' ls --git --icons'
alias la=' ls -a'
alias lai=' li -a'
alias ll=' li --git -l'
alias lt=' li --tree -D -L 2 -I ${TREE_IGNORE}'
alias ltt=' li --tree -D -L 3 -I ${TREE_IGNORE}'
alias lttt=' li --tree -D -L 4 -I ${TREE_IGNORE}'
alias ltttt=' li --tree -D -L 5 -I ${TREE_IGNORE}'

# alias nvim to vim because I get used to it.
alias vim=nvim

# alias mytmux to tmux new -s main-session to quickly start a session
alias mytmux="tmux new -s main-session"

