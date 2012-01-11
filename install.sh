#!/bin/sh

git submodule update --init

BASEDIR=`dirname $0`
for f in `ls -A`
do
  [ .git == $f ] && continue
  [ .gitmodules == $f ] && continue
  [ install.sh == $f ] && continue
  cp -R $BASEDIR/$f ~/
done
