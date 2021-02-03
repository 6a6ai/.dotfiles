#!/bin/bash
# backup current .vimrc and create a symlink to one stored under $HOME/.dotfiles/vim/.vimrc
[ -f ~/.vimrc ] && mv -iv ~/.vimrc ~/.vimrc.custom_backup
ln -sv ~/.dotfiles/vim/.vimrc ~/ 

