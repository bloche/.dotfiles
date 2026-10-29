#!/usr/bin/env bash

# exit on command failure
set -e

thisdir=$(cd `dirname $0`; pwd)

# back up real files before linking over them
link() {
    if [ -e "$2" ] && [ ! -L "$2" ]; then
        bak="$2.bak"
        [ -e "$bak" ] && bak="$2.bak.$(date +%s)"
        mv "$2" "$bak"
        printf '\033[33mBacked up %s to %s\033[0m\n' "$2" "$bak"
    fi
    ln -sfn "$1" "$2"
}

# Initialize vim settings
echo "Initializing vim settings"
echo "-------------------------"
echo "Linking .vim and .vimrc"
link ${thisdir}/.vim ~/.vim
link ~/.vim/.vimrc ~/.vimrc
echo "Installing submodules"
cd ${thisdir}
git submodule init
git submodule update

# Initialize bash profiles
echo 
echo "Initializing bash settings"
echo "--------------------------"
echo "Linking profiles"
link ${thisdir}/.bash_profile ~/.profile
link ~/.profile ~/.bashrc

# Initiatlize zsh settings
echo
echo "Initializing zsh settings"
echo "-------------------------"
echo "Linking .zsh, .zshrc and .zshenv"
link ${thisdir}/.zsh ~/.zsh
link ${thisdir}/.zshrc ~/.zshrc
link ${thisdir}/.zshenv ~/.zshenv

# Initialize claude settings
echo
echo "Initializing claude settings"
echo "----------------------------"
echo "Linking CLAUDE.md, settings.json and agents"
mkdir -p ~/.claude
for f in CLAUDE.md settings.json agents; do
    link ${thisdir}/.claude/$f ~/.claude/$f
done
