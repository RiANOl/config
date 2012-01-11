#!/bin/sh

git submodule update --init

base_dir=`dirname $0`
for file in `ls -A $base_dir`
do
  [ ".git" = $file ] && continue
  [ ".gitmodules" = $file ] && continue
  [ "install.sh" = $file ] && continue
  [ "README" = $file ] && continue
  if [ -e ~/$file ]; then
     echo "$file is exist."
     continue
  else
    cp -R "$base_dir/$file" ~/
  fi
done
