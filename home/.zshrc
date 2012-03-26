export ZSH=$HOME/.oh-my-zsh

plugins=(brew bundler gem git-flow rvm)

source $ZSH/oh-my-zsh.sh

local return_code="%(?..%{$terminfo[bold]$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local current_time='%{$fg[green]%}%*%{$reset_color%}'
local window=''
[ x$WINDOW != x ] && window='%{$fg[yellow]%}#$WINDOW%{$reset_color%} '
local rvm_ruby=''
[ -s "$HOME/.rvm/scripts/rvm" ] && rvm_ruby='%{$fg[red]%}$(rvm-prompt i v g)%{$reset_color%} '
local git_branch='$(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
PROMPT="${user_host} ${current_dir} ${current_time} ${window}${rvm_ruby}${git_branch}%B%#%b "
RPROMPT="${return_code}"

export PATH=~/bin:/usr/local/bin:/usr/local/sbin/:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin

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

unsetopt correct_all
unsetopt auto_menu
zstyle ':completion:*' list-colors ${LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=0=0=01'

function title {
  [ "$DISABLE_AUTO_TITLE" != "true" ] || return
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\"
    print -Pn "\e]2;$2:q\a"
    print -Pn "\e]1;$1:q\a"
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a"
    print -Pn "\e]1;$1:q\a"
  fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

alias l='ll -A'
alias lsa='ls -A'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim -p'

[ -s "$HOME/.zsh-alias" ] && source ~/.zsh-alias
