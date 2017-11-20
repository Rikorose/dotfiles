#!/bin/bash

ln -s "$(readlink -f vimrc)" ~/.vimrc
ln -s "$(readlink -f tmux.conf)" ~/.tmux.conf
mkdir ~/.config
mkdir ~/.config/nvim
ln -s "$(readlink -f config/nvim/init.vim)" ~/.config/nvim/init.vim
mkdir ~/.config/yapf
ln -s "$(readlink -f config/yapf/style)" ~/.config/yapf/style
