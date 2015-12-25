#!/bin/bash

# make a backup copy of existing .vimrc
if [[ -e ~/.vimrc ]] then
  now=$(date +"%m-%d-%Y")
  old=~/vimrc-${now}.bak
  echo "backup old vimrc to $old"
  mv ~/.vimrc $old
fi

# bootstrap vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "make symbolic link of vimrc"
ln -s ~/.vim/vimrc ~/.vimrc

# install plugins
vim +PlugInstall
