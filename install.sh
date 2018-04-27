#!/bin/sh

cd `dirname $0`
git submodule update --init --recursive

base_dir=`pwd`

for file in `ls -A $base_dir/home`
do
  if [ -e ~/$file ]; then
    mv ~/$file ~/$file.bak
  fi
  ln -s $base_dir/home/$file ~/$file
done

ln -s $base_dir/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/
ln -s $base_dir/bullet-train.zsh/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/
