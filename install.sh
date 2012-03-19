#!/bin/sh

git submoudle update --init

base_dir=`dirname $0`"/home"
for file in `ls -A $base_dir`
do
  if [ -e ~/$file ]; then
     mv "~/$file" "~/$file.bak"
  fi
  ln -s "$base_dir/$file" "~/$file"
done
