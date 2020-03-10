eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias x=exit

alias dls='docker ps --format "{{.Names}}"'

function dbash {
  docker exec -it $1  bash
}

alias gitx='open -a GitX .'
alias gc='git checkout'
alias gs='git status'
alias gum='git pull --ff-only origin master'

function gg {
  git checkout $(git branch | grep $1)
}

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
__git_complete gc _git_checkout
export PS1='\W$(__git_ps1 " (%s)") \$ '

alias be='bundle exec'
alias ber='bundle exec rspec'

HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Run FZF install script first
source ~/.fzf.bash

# Load custom .vimrc if one exists in CWD
alias vim='[ -e .vimrc ] && HOME=. vim || vim'
