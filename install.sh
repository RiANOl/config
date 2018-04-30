#!/bin/bash

cd `dirname $0`
git submodule update --init --recursive

base_dir=`pwd`

for file in `ls -A $base_dir/home`
do
    [[ -f ~/$file && ! -L ~/$file ]] && mv ~/$file ~/$file.bak
    ln -fhs $base_dir/home/$file ~/$file
done

ln -fhs $base_dir/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/
ln -fhs $base_dir/bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/
