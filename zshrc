#== shell init
setopt interactivecomments
export PROMPT="%1~ # "

# Set a long shell history
# Don't write these things to .zsh_history:
# - Some common commands with little probative value
# - Back to back repeats of the same command
# - Commands prefaced by a space
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE='(br *|c|cd *|code|echo *|ff|gitx|gs|n|vim|x)'
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Set an editor for viewing gem source code with bundle open
export EDITOR=vim
#==


#== macos app shortcuts
alias gitx='open -a GitX .'
alias code='open -a Visual\ Studio\ Code .'
#==


#== git shortcuts
alias c='git branch --show-current'
alias ff='git pull --ff-only'
alias gc='git checkout'
alias gs='git status'
alias nf='git ls-files --others --exclude-standard'
#==


#== blog
alias n='cd ~/dev/autery.net'
export BLOG_BUCKET=autery-blog
export BLOG_DISTRO_ID=E2L5IEAFAZ9J3N
#==


#== fzf fun
# shell completions - makes ctrl-r more searchable
source /opt/homebrew/Cellar/fzf/0.61.0/shell/key-bindings.zsh

# file preview
alias fp="fzf --preview='cat {}' --preview-window=:75%:wrap"
#==


#== misc
alias x='exit'
alias apl='apserver &; apl --noColor'

# export AOC_SESSION="xxx"

# function gi {
#   curl "https://adventofcode.com/2023/day/$1/input" -H "cookie: session=$AOC_SESSION" --compressed
# }
#==

# Rails 8
alias br='bin/rails'
eval "$(~/.local/bin/mise activate)"

# path additions
# /usr/local/sbin - Homebrew
# ~/dev/tools/flutter/bin - Flutter SDK
export PATH="/usr/local/sbin:$HOME/dev/tools/flutter/bin:$PATH"
