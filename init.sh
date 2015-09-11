#!/usr/bin/env bash

# exit on command failure
set -e

thisdir=$(cd `dirname $0`; pwd)

# Initialize vim settings
echo "Initializing vim settings"
echo "-------------------------"
echo "Linking .vim and .vimrc"
ln -s ${thisdir}/.vim ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
echo "Installing submodules"
cd ${thisdir}
git submodule init
git submodule update

# Initialize bash profiles
echo 
echo "Initializing bash settings"
echo "--------------------------"
echo "Linking profiles"
ln -s ${thisdir}/.bash_profile ~/.profile
ln -s ~/.profile ~/.bashrc

