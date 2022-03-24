#!/bin/bash

cd `dirname $0`
git submodule update --init --recursive

base_dir=`pwd`

for file in `ls -A ${base_dir}/home`
do
    if [[ ! -L ~/${file} ]]; then
        [[ -f ~/${file} ]] && mv ~/${file} ~/${file}.bak
        ln -s ${base_dir}/home/${file} ~/${file}
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
