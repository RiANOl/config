#!/bin/zsh

cd `dirname $0`
git submodule update --init --recursive

base_dir=`pwd`

if [[ ! -L ~/.home ]]; then
    ln -s ${base_dir}/home ~/.home
fi

for file in `ls -A ~/.home`
do
    if [[ ! -L ~/${file} ]]; then
        [[ -f ~/${file} ]] && mv ~/${file} ~/${file}.bak
        ln -s .home/${file} ~/${file}
    fi
done

if [[ ! -L ~/.config/config ]]; then
    ln -s ${base_dir}/config ~/.config/config
fi

for file in `ls -A ~/.config/config`
do
    if [[ ! -L ~/.config/${file} ]]; then
        [[ -f ~/.config/${file} ]] && mv ~/.config/${file} ~/.config/${file}.bak
        ln -s config/${file} ~/.config/${file}
    fi
done

ZIM_HOME=~/.zim

if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
