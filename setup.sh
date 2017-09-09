#!/bin/bash

# make a backup copy of existing .vimrc
if [ -e ~/.vimrc ]; then
  now=$(date +"%m-%d-%Y")
  old=~/vimrc-${now}.bak
  mv ~/.vimrc $old
  echo "old vimrc backed up to $old"
fi

# bootstrap vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link .vimrc
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
echo "created symbolic link of vimrc"

# install plugins
vim -u ~/.vim/vimrc-plugins +PlugInstall +qa!

echo "==========================================="
echo " vim setup complete"
echo " consider installing a powerline font from"
echo " https://github.com/powerline/fonts"
echo "==========================================="

