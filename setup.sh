#!/bin/bash


cat <<EOF

Setup vim Environment
=====================

you have a lot of blocks in ~/.vimrc 
if you don't want a plugin, you should remove
at least the Bundle './.' line

have fun!
EOF

# setup vundle
echo "setup vundle"
cd `dirname $0`
git submodule update --init

# copy vimrc
if [[ -e ~/.vimrc ]]
then
  count=`ls -a ~ | grep vimrc | wc -l`
  old=~/vimrc_${count}.bak
  echo "backup old vimrc to $old"
  mv ~/.vimrc $old
fi

echo "copy vimrc"
ln -s ~/.vim/vimrc ~/.vimrc

# install plugins
vim -c BundleInstall
