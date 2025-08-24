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
HISTORY_IGNORE='((c|cd|code|ff|fg|gitx|gs|n|sh|vim|x)|(echo|ls)*)'
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Set an editor for viewing gem source code with bundle open
export EDITOR=vim
#==

#== folder shortcuts
alias a='cd /Users/cautery/dev/cyberstar/api'
alias m='cd /Users/cautery/dev/cyberstar'
alias u='cd /Users/cautery/dev/cyberstar/frontend'
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
alias ga='git status -uall'
alias nf='git ls-files --others --exclude-standard'
#==

#== misc shortcuts
# start Open WebUI - make sure Ollama is running first
alias ow='cd ~/dev/tools/open-webui && . ./bin/activate && open-webui serve'
alias ds='docker compose stop'
# alias fng='find . -type d -name ".git" -prune -o -print'
fng() {
  local dir action
  dir="${1:-.}"                   # Directory (default: .)
  action="${2:--print}"           # Action (default: -print if not given)

  find "$dir" -type d -name .git -prune -o $action
}

# count rows in multiple tables
tblcounts() {
  # Usage: tblcounts table1 table2 ...
  local query=""
  for t in "$@"; do
    [[ -n $query ]] && query+=" UNION ALL "
    query+="SELECT COUNT(*) FROM $t"
  done
  mysql -BNe "$query"
}
#==

#== fzf fun
# shell completions - makes ctrl-r more searchable
source /opt/homebrew/Cellar/fzf/0.65.1/shell/key-bindings.zsh

# file preview
alias fp="fzf --preview='cat {}' --preview-window=:75%:wrap"
#==

# path additions
export PATH="$HOME/.bun/bin:/opt/homebrew/bin:$PATH"

# bun completions
[ -s "/Users/cautery/.bun/_bun" ] && source "/Users/cautery/.bun/_bun"
eval "$(mise activate)"

