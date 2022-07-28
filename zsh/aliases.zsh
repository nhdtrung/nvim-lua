# Aliases in this file are bash and zsh compatible

# ~/.zshrc
# source ~/.config/nvim/zsh/aliases.zsh
# source ~/.zshrc

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

alias nv="nvim ."

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# Show me files matching "ls grep"
alias lsg='ll | grep'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Kill
alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew doctor'

# Docker compose
alias dcu='docker-compose up -d'
alias dcr='docker-compose restart'
alias dcd='docker-compose down'
alias dcdv='docker-compose down -v'
alias dcs='docker-compose stop'
alias dcps='docker-compose ps -a'

# Docker 
alias dst='docker kill $(docker ps -q)'
alias dps='docker ps -a'
 
alias cdc='cd ~/code'
