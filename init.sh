#!/usr/bin/env bash

# exit on command failure
set -e

cd ~/.dotfiles
# Initialize vim settings
echo "Initializing vim settings"
echo "-------------------------"
echo "Linking .vim and .vimrc"
ln -s .vim ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
echo "Installing submodules"
git submodule init
git submodule update

# Initialize bash profiles
echo 
echo "Initializing bash settings"
echo "--------------------------"
echo "Linking profiles"
ln -s .bash_profile ~/.bash_profile
ln -s ~/.bash_profile ~/.bashrc

