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

change_default_shell() {
  if [ "$(getent passwd $LOGNAME | cut -d: -f7)" == "$(which $1)" ];then
      echo "Default shell is $1."
  else
    echo "Default shell is not $1."
    if ask "Do you want to chsh -s \$(which $1)?" Y; then
      chsh -s $(which $1)
      return 0
    else
      return 1 # 1 = false
    fi
  fi
}

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

if check_for_software fish; then
  if change_default_shell fish; then
    mkdir -p ~/.config
    ln $1 -s "$(readlink -f fish)" ~/.config/
  fi
else
  echo "fish shell not installed, not linkning config"
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
  mkdir -p ~/.config/nvim
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

if ask "Setup StevenBlack/hosts?" Y; then
  if check_for_software git; then
    git clone https://github.com/StevenBlack/hosts ~/.hosts
  else
    echo "git not installed, can't clone StevenBlack/hosts."
  fi
fi

if ask "Install miniconda?" N; then
  if check_for_software wget; then
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
         -P /tmp
    /usr/bin/env bash /tmp/Miniconda3-latest-Linux-x86_64.sh
  fi
fi

ln $1 -s "$(readlink -f bin/update-hosts.sh)" ~/.local/bin/update-hosts
ln $1 -s "$(readlink -f bin/extract.sh)" ~/.local/bin/extract
