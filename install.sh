#!/bin/sh

base_dir=`dirname $0`
for file in `ls -A $base_dir`
do
  [ ".git" = $file ] && continue
  [ "install.sh" = $file ] && continue
  [ "README" = $file ] && continue
  if [ -e ~/$file ]; then
     echo "$file is exist."
     continue
  else
    cp -R "$base_dir/$file" ~/
  fi
done

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails
git clone https://github.com/tpope/vim-markdown.git ~/.vim/bundle/vim-markdown
git clone https://github.com/Shougo/neocomplcache.git ~/.vim/bundle/neocomplcache
