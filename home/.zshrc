export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

type nodenv &> /dev/null && eval "$(nodenv init -)"
type pyenv &> /dev/null && eval "$(pyenv init -)"
type pyenv-virtualenv &> /dev/null && eval "$(pyenv virtualenv-init -)"
type rbenv &> /dev/null && eval "$(rbenv init -)"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DISABLE_AUTO_UPDATE="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

plugins=(zsh-syntax-highlighting)

type aws &> /dev/null && plugins+=(aws)
type bundle &> /dev/null && plugins+=(bundler)
type docker &> /dev/null && plugins+=(docker)
type gem &> /dev/null && plugins+=(gem)
git flow version &> /dev/null && plugins+=(git-flow-avh)
type http &> /dev/null && plugins+=(httpie)
type nomad &> /dev/null && plugins+=(nomad)
type pip &> /dev/null && plugins+=(pip)
type pod &> /dev/null && plugins+=(pod)
type python &> /dev/null && plugins+=(python)
type redis-cli &> /dev/null && plugins+=(redis-cli)
type terraform &> /dev/null && plugins+=(terraform)
type vagrant &> /dev/null && plugins+=(vagrant)

source $ZSH/oh-my-zsh.sh

dark_grey="%F{239}"
light_grey="%F{245}"
yellow="%F{136}"
orange="%F{166}"
red="%F{124}"
magenta="%F{125}"
violet="%F{61}"
blue="%F{33}"
cyan="%F{37}"
green="%F{64}"

ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold

user_host="%{$green%}%n%{$dark_grey%}@%{$cyan%}%m%{$reset_color%}"
current_dir="%{$blue%}%~%{$reset_color%}"
current_time="%{$dark_grey%}[%{$violet%}%T%{$dark_grey%}]%{$reset_color%}"
prompt_char="%{$light_grey%}%#%{$reset_color%}"

window=""
window_number=""
[[ x$WINDOW != x ]] && window="$WINDOW"
[[ x$TMUX_PANE != x ]] && window=$(tmux display -p -t $TMUX_PANE "#I")
[[ x$ITERM_SESSION_ID != x ]] && window=`echo $ITERM_SESSION_ID | cut -dt -f2 | cut -dp -f1`
[[ x$window != x ]] && window_number="%{$dark_grey%}[%{$magenta%}#$window%{$dark_grey%}]%{$reset_color%}"

git_branch=""
type git &> /dev/null && git_branch='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$dark_grey%}[%{$orange%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$dark_grey%}]%{$reset_color%}"

nodenv_version=""
type nodenv &> /dev/null && nodenv_version='%{$dark_grey%}[%{$green%}$(nodenv version-name)%{$dark_grey%}]%{$reset_color%}'

pyenv_version=""
type pyenv &> /dev/null && pyenv_version='%{$dark_grey%}[%{$yellow%}$(pyenv version-name)%{$dark_grey%}]%{$reset_color%}'

rbenv_version=""
type rbenv &> /dev/null && rbenv_version='%{$dark_grey%}[%{$red%}$(rbenv version-name)%{$dark_grey%}]%{$reset_color%}'

export PROMPT="${user_host} ${current_dir} ${prompt_char} "
export RPROMPT="${window_number}${git_branch}${nodenv_version}${pyenv_version}${rbenv_version}${current_time}"

export LANG='en_US.UTF-8'
export LC_ALL=$LANG
export LANGUAGE='en'

export LS_COLORS='no=0:fi=0:di=94:ln=96:pi=30;43:so=95:do=35:bd=93:cd=33:or=36:mi=90:su=30;102:sg=30;42:tw=30;41:ow=30;104:st=91:ex=92'
export LSCOLORS='ExGxFxadCxDxdxaCacabaE'
export GREP_COLOR='38;5;166'
export BLOCKSIZE='K'
export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export LESS='-FRX'
export LESS_TERMCAP_mb=$(printf "\e[38;5;124m")
export LESS_TERMCAP_md=$(printf "\e[38;5;33m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[38;5;166m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[38;5;64m")
export LESSHISTFILE='/dev/null'
unset HISTFILE

unsetopt auto_menu
zstyle ':completion:*' list-colors ${LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=0=0=01'

alias l='ll -A'
alias lsa='ls -A'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim -p'

[[ -s "$HOME/.zshrc_local" ]] && . "$HOME/.zshrc_local"
