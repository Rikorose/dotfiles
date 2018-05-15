#!/usr/bin/env bash

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

ask() {
  # https://djm.me/ask
  local prompt default reply

  while true; do

    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi

    # Ask the question (not using "read -p" as it uses stderr not stdout)
    echo -n "$1 [$prompt] "

    # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
    read reply </dev/tty

    # Default?
    if [ -z "$reply" ]; then
      reply=$default
    fi

    # Check if the reply is valid
    case "$reply" in
      Y*|y*) return 0;;
      N*|n*) return 1;;
    esac

  done
}

ln $1 -s "$(readlink -f bash/bashrc)" ~/.bashrc
ln $1 -s "$(readlink -f bash/bash_profile)" ~/.bash_profile
ln $1 -s "$(readlink -f bash/inputrc)" ~/.inputrc

if check_for_software ssh; then
  echo linking .ssh/config
  mkdir -p ~/.ssh
  ln $1 -s "$(readlink -f ssh/config)" ~/.ssh/
  chmod 600 ~/.ssh/config
  chown $USER ~/.ssh/config
  if ! check_for_software ssh-ident; then
    if ask "Install ssh-ident?" Y; then
      mkdir -p ~/.local/bin
      ln $1 -s "$(readlink -f ssh/ssh-ident/ssh-ident)" ~/.local/bin
    fi
  fi
fi

if check_for_software sway; then
  echo linking .config/sway/
  mkdir -p ~/.config
  ln $1 -s "$(readlink -f sway)" ~/.config/
  ln $1 -s "$(readlink -f bin/launch-sway.sh)" ~/.local/bin/launch-sway
  ln $1 -s "$(readlink -f bin/lock-screen.sh)" ~/.local/bin/lock-screen
else
  echo "sway not installed, not linking config"
fi

if check_for_software i3blocks; then
  echo linking .config/i3blocks/
  mkdir -p ~/.config
  ln $1 -s "$(readlink -f i3blocks)" ~/.config/
else
  echo "i3blocks not installed, not linking config"
fi

if check_for_software dunst; then
  echo linking .config/dunst/dunstrc
  ln $1 -s "$(readlink -f dunst)" ~/.config/
else
  echo "dunst not installed, not linking config"
fi

if check_for_software vim; then
  echo "linking .vimrc"
  ln $1 -s "$(readlink -f vim/vimrc)" ~/.vimrc
  mkdir -p ~/.vim
  mkdir -p ~/.vim/ftplugin
  ln $1 -s "$(readlink -f vim/ftplugin/python.vim)" ~/.vim/ftplugin/python.vim
else
  echo "vim not installed, not linking config"
fi

if check_for_software nvim; then
  mkdir -p ~/.config
  echo "linking .config/nvim/init.vim"
  ln $1 -s "$(readlink -f nvim)" ~/.config/
else
  echo "nvim not installed, not linking config"
fi

if check_for_software tmux; then
  echo "linking .tmux.conf"
  ln $1 -s "$(readlink -f tmux/tmux.conf)" ~/.tmux.conf
else
  echo "tmux not installed, not linking config"
fi

if check_for_software yapf; then
  echo "linking .config/yapf/style"
  ln $1 -s "$(readlink -f yapf)" ~/.config/
else
  echo "yapf not installed, not linking config"
fi

if check_for_software mpv; then
  echo "linking .config/mpv/mpv.conf"
  ln $1 -s "$(readlink -f mpv)" ~/.config/
else
  echo "mpv not installed, not linking config"
fi

if ask "Install miniconda?" N; then
  if check_for_software wget; then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
         -P /tmp
    /usr/bin/env bash /tmp/Miniconda3-latest-Linux-x86_64.sh
  fi
fi

mkdir -p ~/.local/bin
ln $1 -s "$(readlink -f bin/update-hosts.sh)" ~/.local/bin/update-hosts
ln $1 -s "$(readlink -f bin/extract.sh)" ~/.local/bin/extract
ln $1 -s "$(readlink -f bin/launch-sway.sh)" ~/.local/bin/launch-sway
ln $1 -s "$(readlink -f bin/lock-screen.sh)" ~/.local/bin/lock-screen
ln $1 -s "$(readlink -f bin/lock-suspend.sh)" ~/.local/bin/lock-suspend

