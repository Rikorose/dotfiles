#!/bin/bash

ln -s "$(readlink -f vimrc)" ~/.vimrc
ln -s "$(readlink -f tmux.conf)" ~/.tmux.conf
mkdir -p ~/.config
mkdir -p ~/.config/nvim
ln -s "$(readlink -f config/nvim/init.vim)" ~/.config/nvim/init.vim
mkdir -p ~/.config/yapf
ln -s "$(readlink -f config/yapf/style)" ~/.config/yapf/style
mkdir -p ~/.vim
mkdir -p ~/.vim/ftplugin
ln -s "$(readlink -f vim/ftplugin/python.vim)" ~/.vim/ftplugin/python.vim
