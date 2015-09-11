#!/usr/bin/env bash

# Initialize vim settings
echo "Initializing vim settings"
echo "-------------------------"
echo "Linking .vimrc"
ln -s ~/.vim/.vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
