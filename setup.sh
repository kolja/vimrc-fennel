#!/bin/bash

# setup vundle
echo "setup vundle"
cd `dirname $0`
git submodule update --init

# make a backup copy of existing .vimrc
if [[ -e ~/.vimrc ]] 
then
  count=`ls -a ~ | grep vimrc | wc -l`
  old=~/vimrc_${count}.bak
  echo "backup old vimrc to $old"
  mv ~/.vimrc $old
fi

echo "make symbolic link of vimrc"
ln -s ~/.vim/vimrc ~/.vimrc

# install plugins
vim +PluginInstall +qall
