#!/bin/sh

/usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh

base_dir="$HOME/.vim/bundle/"
for file in `ls -A $base_dir`
do
  echo "Upgrading $file"
  cd $base_dir$file
  git pull
done
