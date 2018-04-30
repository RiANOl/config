#!/bin/bash

cd `dirname $0`
git submodule update --init --recursive

base_dir=`pwd`

for file in `ls -A $base_dir/home`
do
    if [ ! -L ~/$file ]; then
        [[ -f ~/$file ]] && mv ~/$file ~/$file.bak
        ln -s $base_dir/home/$file ~/$file
    fi
done

if [ ! -L ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    ln -s $base_dir/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/
fi
if [ ! -L ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme ]; then
    ln -s $base_dir/bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/
fi
