#!/bin/sh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# link
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/hyper.js ~/.hyper.js
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim
ln -s ${BASEDIR}/zshrc ~/.zshrc

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle --file=${BASEDIR}/Brewfile
