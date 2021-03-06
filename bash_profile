alias orbot="ssh -i ~/.ssh/atlas/orbot_keypair.pem ubuntu@54.174.14.69"
alias contentloader="ssh -i ~/.ssh/atlas/orbot_keypair.pem ubuntu@54.86.226.133"
alias gitprod="ssh -i ~/.ssh/atlas/atlas_production_keypair.pem ubuntu@54.84.204.203"
alias gitdev="ssh -i ~/.ssh/atlas/atlas_production_keypair.pem ubuntu@54.84.249.148"
alias workerstage="ssh -i ~/.ssh/atlas/atlas_production_keypair.pem ubuntu@54.86.237.24"
alias workerprod="ssh -i ~/.ssh/atlas/atlas_production_keypair.pem ubuntu@54.164.101.249"
alias workerbeta="ssh -i ~/.ssh/atlas/atlas_production_keypair.pem ubuntu@54.173.233.166"


# export DOCKER_HOST=tcp://192.168.59.103:2375
export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/zach/.docker/boot2docker-vm
export DOCKER_CERT_PATH=/Users/zach/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

alias dockerkillall='docker kill $(docker ps -q)'
alias dockerrmlast='docker rm -f  $(docker ps -aq | head -1)'
alias dockerloglast='docker logs -f  $(docker ps -q | head -1)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export GOREILLY="src/github.com/oreillymedia"
alias goreilly="cd $GOPATH/$GOREILLY"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


# PS1="\n\e[0;33m\w\e[m\n\u@\h  sez:\n"
PS1='\n\e[0;33m\w\e[m\n\[\033[38;5;37m\]\@\[$(tput sgr0)\] \u@\h$(__git_ps1 " (on \e[0;35m\]%s\[\e[0m\])"):\n'
# PS1='\n\e[0;33m\w\e[m\n\u@\h $(__git_ps1 "(on \e[0;35m\]%s\[\e[0m\]) ")sez:\n'
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

git config --global color.ui true
alias gitlg="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"

alias s="git status -s"
alias ls='ls -F'
alias ll='ls -l -h'
alias la='ls -a'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

alias serve='python -m SimpleHTTPServer'
alias sserve='twistd -n web -p 8887 --path .'

alias vgs='vagrant global-status'

function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
source ~/.git-completion.sh
# from https://github.com/git/git/tree/master/contrib/completion
source ~/.git-prompt.sh
# https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
