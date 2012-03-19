#!/bin/sh

bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

cd `dirname $0`
git submodule update --init

cd home
base_dir=`pwd -P`

for file in `ls -A $base_dir`
do
  if [ -e ~/$file ]; then
     mv ~/$file ~/$file.bak
   fi
  ln -s $base_dir/$file ~/$file
done
