export PATH=~/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

type rbenv &> /dev/null && eval "$(rbenv init -)"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"

plugins=(brew bundler gem git-flow)

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

user_host="%{$green%}%n%{$dark_grey%}@%{$cyan%}%m%{$reset_color%}"
current_dir="%{$blue%}%~%{$reset_color%}"
current_time="%{$dark_grey%}[%{$violet%}%T%{$dark_grey%}]%{$reset_color%}"
prompt_char="%{$light_grey%}%#%{$reset_color%}"

window=""
window_number=""
[[ x$WINDOW != x ]] && window='$WINDOW'
[[ x$TMUX_PANE != x ]] && window='$(tmux display -p "#I")'
[[ x$window != x ]] && window_number="%{$dark_grey%}[%{$magenta%}#$window%{$dark_grey%}]%{$reset_color%}"

git_branch='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$dark_grey%}[%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$dark_grey%}]%{$reset_color%}"

rbenv_version=""
type rbenv &> /dev/null && rbenv_version='%{$dark_grey%}[%{$red%}$(rbenv version-name)%{$dark_grey%}]%{$reset_color%}'

export PROMPT="${user_host} ${current_dir} ${prompt_char} "
export RPROMPT="${window_number}${git_branch}${rbenv_version}${current_time}"

export LANG='en_US.UTF-8'
export LANGUAGE=$LANG
export LC_CTYPE=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG
export LC_COLLATE=$LANG
export LC_MONETARY=$LANG
export LC_MESSAGES=$LANG
export LC_PAPER=$LANG
export LC_NAME=$LANG
export LC_ADDRESS=$LANG
export LC_TELEPHONE=$LANG
export LC_MEASUREMENT=$LANG
export LC_ALL=$LANG

[[ x$WINDOW == x ]] && [[ x$TMUX_PANE == x ]] && export TERM=xterm-256color

export LS_COLORS='no=0:fi=0:di=94:ln=96:pi=30;43:so=95:do=35:bd=93:cd=33:or=36:mi=90:su=30;102:sg=30;42:tw=30;41:ow=30;104:st=91:ex=92'
export LSCOLORS='ExGxFxadCxDxdxaCacabaE'
export GREP_COLOR='1;33'
export BLOCKSIZE='K'
export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER='less'
export LESS='-FRX'
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

[[ -s "$HOME/.zsh_alias" ]] && . "$HOME/.zsh_alias"
