#== shell init
eval "$(rbenv init -)"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# Save time by not loading NVM on each shell
export NVM_DIR="$HOME/.nvm"
alias ns='. /usr/local/opt/nvm/nvm.sh'

# Set a long shell history, don't write repeats
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS

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

function gg {
  git checkout $(git branch | grep $1)
}
#==


#== folder shortcuts
alias a='cd /Users/curtis/dev/rvshare/rvshare-setup/rvshare-api'
alias d='cd /Users/curtis/dev/rvshare/rvshare-setup/rvshare-dashboard'
alias de='cd /Users/curtis/dev/rvshare/rvshare-devops'
alias e='cd /Users/curtis/dev/rvshare/rvshare-e2e_v2'
alias i='cd /Users/curtis/Library/Application\ Support/Insomnia/plugins'
alias m='cd /Users/curtis/dev/rvshare/rvshare-setup/rvshare-marketplace'
alias n='cd ~/dev/autery.net'
alias s='cd /Users/curtis/dev/rvshare/rvshare-setup/scrub-cop'
alias v='cd /Users/curtis/dev/rvshare/rvshare-setup'
#==


#== docker management
alias dstop='cd ~/dev/rvshare/rvshare-setup; make stop_all; cd -'
alias dbash='docker exec -it rvshare-api doppler run bash'

# Set doppler tokens as env variables
function t {
  export DOPPLER_TOKEN_DASHBOARD=$(cat /tmp/dashboard_token)
  export DOPPLER_TOKEN_MARKETPLACE=$(cat /tmp/marketplace_token)
  export DOPPLER_TOKEN_API=$(cat /tmp/api_token)
  export DOPPLER_TOKEN_SCRUB=$(cat /tmp/scrubcop_token)
}

# "docker compose override" - The override yaml file swaps rails for bash, marketplace, and scrubcop
# By attaching to a container that is only running bash, you can restart rails without restarting the container
alias dco='docker compose -f ~/dev/rvshare/rvshare-setup/docker-compose.yml -f ~/.docker-compose.override.yml'

function dapi {
  t
  dco up -d rvshare-api
  docker attach rvshare-api
}
#==


#== aws management (some require jq)
alias p='AWS_PROFILE=personal'

# Shows instance IDs and IP addresses of qa servers by name, e.g. qa-curtis-rvshare-api
function listinstances {
  aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[] | [.InstanceId, .PrivateIpAddress]"
}

# Same as above, but specifically for production API workers
alias prodworkers='aws ec2 describe-instances --filters "Name=tag:Name,Values=prod-rvshare-api-worker" --region us-east-1 | jq ".Reservations[].Instances[] | [.InstanceId, .PrivateIpAddress]"'

# Get the task ARN of the UAT API server, the last segment is the task ID
alias uat='aws ecs list-tasks --cluster uat --profile uat --service-name api'

# Open an interactive shell on an ecs server, change profile/cluster/container to match task
function ecs {
  aws ecs execute-command --profile uat --cluster uat --task $1 --container api --command bash --interactive
}
#==


#== ssh shortcuts
function goqa {
  ssh -i ~/.ssh/oh-staging-qa.pem ec2-user@$1
}

function goprod {
  ssh -i ~/.ssh/rvshare-aws.pem ec2-user@$1
}
#==


#== fzf fun
# shell completions - makes ctrl-r more searchable
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"

# file preview
alias fp="fzf --preview='cat {}' --preview-window=:75%:wrap"
#==


#== misc
alias x='exit'
alias apl='apserver &; apl --noColor'

export GITHUB_TOKEN='ghp_xxxxxxx'

# lint
alias l="yarn husky-run pre-commit"
#==
