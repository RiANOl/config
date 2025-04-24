if type /opt/homebrew/bin/brew &> /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi

type direnv &> /dev/null && eval "$(direnv hook zsh)"
type goenv &> /dev/null && export GOENV_GOPATH_PREFIX=${HOME}/.go && GOENV_PATH_ORDER=front eval "$(goenv init -)"
type nodenv &> /dev/null && eval "$(nodenv init -)"
type pyenv &> /dev/null && eval "$(pyenv init --path)" && eval "$(pyenv init -)"
type rbenv &> /dev/null && eval "$(rbenv init -)"
type oh-my-posh &> /dev/null && eval "$(oh-my-posh init zsh --config ${HOME}/.config/oh-my-posh/config.yaml)"

export PATH="${HOME}/.local/bin:${PATH}"

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

ZIM_HOME=${HOME}/.zim

autoload -U select-word-style
select-word-style bash

source ${ZIM_HOME}/init.zsh

if type eza &> /dev/null; then
    export EZA_CONFIG_DIR=${HOME}/.config/eza
    alias ls='eza --icons --color-scale --sort=Name --time-style=long-iso'
    alias lsa='ls --all'
    alias ll='ls --long --group'
    alias l='ll --all'
    alias lk='l --sort=size'
    alias lt='l --sort=modified'
    alias lr='l --tree'
else
    if ls --color=auto &> /dev/null; then
        alias ls='ls -D "%Y-%m-%d %H:%M" --color=auto'
    else
        alias ls='ls -D "%Y-%m-%d %H:%M"'
    fi
    alias lsa='ls -A'
    alias ll='ls -lh'
    alias l='ll -A'
    alias lk='l -Sr'
    alias lt='l -tr'
    alias lr='l -R'
fi

if type fzf &> /dev/null; then
    export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
        --highlight-line \
        --info=inline-right \
        --ansi \
        --layout=reverse \
        --border=none \
        --color=bg+:#283457 \
        --color=bg:#16161e \
        --color=border:#27a1b9 \
        --color=fg:#c0caf5 \
        --color=gutter:#16161e \
        --color=header:#ff9e64 \
        --color=hl+:#2ac3de \
        --color=hl:#2ac3de \
        --color=info:#545c7e \
        --color=marker:#ff007c \
        --color=pointer:#ff007c \
        --color=prompt:#2ac3de \
        --color=query:#c0caf5:regular \
        --color=scrollbar:#27a1b9 \
        --color=separator:#ff9e64 \
        --color=spinner:#ff007c \
"
fi

alias grep='grep --color=auto'

alias df='df -h'
alias du='du -h'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias vi="${VI}"
alias vim="${VI}"
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
