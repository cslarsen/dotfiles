#!/bin/bash

function symlink() {
  if [ ! -e $HOME/$1 ] ; then
    echo "Symlinking $HOME/$1"
    ln -s `pwd`/$1 $HOME/$1
  else
    echo "Already have $1"
  fi
}

symlink .bash_profile
symlink .inputrc
symlink .oh-my-zsh
symlink .tmux.conf
symlink .vim
symlink .vimp
symlink .vimrc
symlink .zsh
symlink .zshrc
