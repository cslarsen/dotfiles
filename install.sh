#!/bin/bash

function symlink() {
  # Don't overwrite files, dirs or links
  if [ ! -e $HOME/$1 ] && \
     [ ! -d $HOME/$1 ] && \
     [ ! -L $HOME/$1 ];
  then
    echo "Symlinking $HOME/$1"
    ln -s `pwd`/$1 $HOME/$1
  else
    echo "Already have $1"
  fi
}

git submodule update --init oh-my-zsh

symlink .bash_profile
symlink .inputrc
symlink .oh-my-zsh
symlink .tmux.conf
symlink .vim
symlink .vimp
symlink .vimrc
symlink .zsh
symlink .zshrc
