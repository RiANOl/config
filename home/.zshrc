export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

type nodenv &> /dev/null && eval "$(nodenv init -)"
type pyenv &> /dev/null && eval "$(pyenv init -)"
type pyenv-virtualenv &> /dev/null && eval "$(pyenv virtualenv-init -)"
type rbenv &> /dev/null && eval "$(rbenv init -)"

plugins=(
    zsh-syntax-highlighting
    aws
    bundler
    docker
    gem
    httpie
    nomad
    pip
    pod
    python
    redis-cli
    terraform
    vagrant
)

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bullet-train"
DISABLE_AUTO_UPDATE="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_DIR_EXTENDED=2

source $ZSH/oh-my-zsh.sh

export LANG='en_US.UTF-8'
export LC_ALL=$LANG
export LANGUAGE='en'

export LS_COLORS='di=34:ln=36:so=35:pi=95:ex=32:bd=33:cd=91:su=30;42:sg=30;42:tw=30;46:ow=30;44:mi=90:or=36:st=34'
export LSCOLORS='exgxfxFxcxdxBxacacagae'
export GREP_COLOR='33'
export BLOCKSIZE='K'
export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export LESS='-FRX'
export LESS_TERMCAP_mb=$(printf "\e[31m")
export LESS_TERMCAP_md=$(printf "\e[34m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[32m")
export LESSHISTFILE='/dev/null'
unset HISTFILE

unsetopt auto_menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias l='ll -A'
alias lsa='ls -A'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim -p'

[[ -s "$HOME/.zshrc_local" ]] && . "$HOME/.zshrc_local"
