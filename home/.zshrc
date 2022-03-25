if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type /opt/homebrew/bin/brew &> /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi

type goenv &> /dev/null && eval "$(goenv init -)"
type nodenv &> /dev/null && eval "$(nodenv init -)"
type pyenv &> /dev/null && eval "$(pyenv init --path)" && eval "$(pyenv init -)"
type rbenv &> /dev/null && eval "$(rbenv init -)"

export PATH="${HOME}/bin:${PATH}"

export LC_ALL='en_US.UTF-8'
export LANG="${LC_ALL}"
export LANGUAGE='en'

type nvim &> /dev/null && VI='nvim' || VI='vim'
export EDITOR="${VI}"
export VISUAL="${VI}"
export PAGER='less'

export CLICOLOR=1
export LS_COLORS='di=34:ln=36:so=35:pi=95:ex=32:bd=33:cd=31:su=92:sg=92:tw=94:ow=94:st=94:mi=90:or=96'
export LSCOLORS='exgxfxFxcxdxbxCaCaEaEa'

export GREP_COLOR='33'

export LESS='-FRX'
export LESS_TERMCAP_mb=$(printf "\e[31m")
export LESS_TERMCAP_md=$(printf "\e[34m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[32m")

ZIM_HOME=~/.zim
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

source ${HOME}/.p10k.zsh
source ${ZIM_HOME}/init.zsh

if type exa &> /dev/null; then
    alias ls='exa -g'
    alias lsa='ls -a'
    alias ll='ls -l'
    alias l='ll -a'
    alias lk='l -ssize'
    alias lt='l -smodified'
    alias lr='l -T'
else
    ls --color=auto &> /dev/null && alias ls='ls --color=auto'
    alias lsa='ls -A'
    alias ll='ls -lh'
    alias l='ll -A'
    alias lk='l -Sr'
    alias lt='l -tr'
    alias lr='l -R'
fi

alias grep='grep --color=auto'

alias df='df -h'
alias du='df -u'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias vi="${VI} -p"
alias vim="${VI} -p"
alias vimdiff="${VI} -d"

# up arrow
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

# down arrow
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey '^[[5~'   up-line-or-history    # page up
bindkey '^[[6~'   down-line-or-history  # page down
bindkey '^[OF'    end-of-line           # end
bindkey '^[OH'    beginning-of-line     # home
bindkey '^[[F'    end-of-line           # end
bindkey '^[[H'    beginning-of-line     # home
bindkey '^[[1;5C' end-of-line           # ctrl + right arrow
bindkey '^[[1;5D' beginning-of-line     # ctrl + left arrow
bindkey '^[[1;3C' forward-word          # alt + right arrow
bindkey '^[[1;3D' backward-word         # alt + left arrow
bindkey '^[^[[C'  forward-word          # esc + right arrow
bindkey '^[^[[D'  backward-word         # esc + left arrow
bindkey '^[[Z'    reverse-menu-complete # shift + tab

[[ -s "${HOME}/.zshrc.local" ]] && . "${HOME}/.zshrc.local"
