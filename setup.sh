#!/bin/bash

# Checks for installed software and links the dotfiles
# Make sure to clone this repository into ~/
# Pass -f to force linkage

check_for_software() {
  echo "Checking to see if $1 is installed"
  if ! [ -x "$(command -v $1)" ]; then
    echo "$1 is not installed."
    return 1 # 1 = false
  else
    echo "$1 is installed."
    return 0
  fi
}

check_default_shell() {
  if [ -z "${SHELL##*zsh*}" ] ;then
      echo "Default shell is zsh."
  else
    echo -n "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)"
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg && echo
    if echo "$answer" | grep -iq "^y" ;then
      chsh -s $(which zsh)
    else
      echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
    fi
  fi
}

if check_for_software vim ; then
  check_default_shell
  export ZSH="$HOME/dotfiles/zsh/plugins/oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && rm ~/.zshrc
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/dotfiles/zsh/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/zsh/plugins/zsh-autosuggestions
  ln $1 -s "$(readlink -f zsh/zshrc)" ~/.zshrc
fi

if check_for_software vim ; then
  echo "linking .vimrc"
  ln $1 -s "$(readlink -f vim/vimrc)" ~/.vimrc
  mkdir -p ~/.vim
  mkdir -p ~/.vim/ftplugin
  ln $1 -s "$(readlink -f vim/ftplugin/python.vim)" ~/.vim/ftplugin/python.vim
fi

if check_for_software nvim ; then
  mkdir -p ~/.config
  mkdir -p ~/.config/nvim
  echo "linking .config/nvim/init.vim"
  ln $1 -s "$(readlink -f nvim/init.vim)" ~/.config/nvim/init.vim
fi

if check_for_software tmux ; then
  echo "linking .tmux.conf"
  ln $1 -s "$(readlink -f tmux/tmux.conf)" ~/.tmux.conf
fi

if check_for_software yapf ; then
  echo "linking .config/yapf/style"
  mkdir -p ~/.config/yapf
  ln $1 -s "$(readlink -f yapf/style)" ~/.config/yapf/style
fi
