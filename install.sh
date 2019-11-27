#!/bin/sh
#
# Usage:
#
#    sh install.sh
#
# Environment variables: VERBOSE, CP, LN, MKDIR, RM, DIRNAME.
#
#    env VERBOSE=1 sh install.sh
#
# DO NOT EDIT THIS FILE
# 
# This file is generated by rcm(7) as:
#
#   rcup -B 0 -g
#
# To update it, re-run the above command.
#
: ${VERBOSE:=0}
: ${CP:=/bin/cp}
: ${LN:=/bin/ln}
: ${MKDIR:=/bin/mkdir}
: ${RM:=/bin/rm}
: ${DIRNAME:=/usr/bin/dirname}
verbose() {
  if [ "$VERBOSE" -gt 0 ]; then
    echo "$@"
  fi
}
handle_file_cp() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        $RM -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi
  verbose "'$1' -> '$2'"
  $MKDIR -p "$($DIRNAME "$2")"
  $CP -R "$1" "$2"
}
handle_file_ln() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        $RM -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi
  verbose "'$1' -> '$2'"
  $MKDIR -p "$($DIRNAME "$2")"
  $LN -sf "$1" "$2"
}
handle_file_ln "$HOME/.dotfiles/bash_profile" "$HOME/.bash_profile"
handle_file_ln "$HOME/.dotfiles/bashrc" "$HOME/.bashrc"
handle_file_ln "$HOME/.dotfiles/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/battery" "$HOME/.config/i3blocks/battery"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/bluetooth" "$HOME/.config/i3blocks/bluetooth"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/brightness" "$HOME/.config/i3blocks/brightness"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/calendar" "$HOME/.config/i3blocks/calendar"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/config" "$HOME/.config/i3blocks/config"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/mediaplayer" "$HOME/.config/i3blocks/mediaplayer"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/mediaplayer2" "$HOME/.config/i3blocks/mediaplayer2"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/process_input" "$HOME/.config/i3blocks/process_input"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/volume" "$HOME/.config/i3blocks/volume"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/wifi" "$HOME/.config/i3blocks/wifi"
handle_file_ln "$HOME/.dotfiles/config/mpv/input.conf" "$HOME/.config/mpv/input.conf"
handle_file_ln "$HOME/.dotfiles/config/mpv/mpv.conf" "$HOME/.config/mpv/mpv.conf"
handle_file_ln "$HOME/.dotfiles/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/completion.vim" "$HOME/.config/nvim/lib/completion.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/editing.vim" "$HOME/.config/nvim/lib/editing.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/files.vim" "$HOME/.config/nvim/lib/files.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/git.vim" "$HOME/.config/nvim/lib/git.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/interface.vim" "$HOME/.config/nvim/lib/interface.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/cpp.vim" "$HOME/.config/nvim/lib/languages/cpp.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/json.vim" "$HOME/.config/nvim/lib/languages/json.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/python.vim" "$HOME/.config/nvim/lib/languages/python.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/tex.vim" "$HOME/.config/nvim/lib/languages/tex.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/yaml.vim" "$HOME/.config/nvim/lib/languages/yaml.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/plugins.vim" "$HOME/.config/nvim/lib/plugins.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/spell/de.utf-8.add" "$HOME/.config/nvim/spell/de.utf-8.add"
handle_file_ln "$HOME/.dotfiles/config/nvim/spell/en.utf-8.add" "$HOME/.config/nvim/spell/en.utf-8.add"
handle_file_ln "$HOME/.dotfiles/config/sway/config" "$HOME/.config/sway/config"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/colors" "$HOME/.config/sway/config.d/colors"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/exit-menu" "$HOME/.config/sway/config.d/exit-menu"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/idle-manager" "$HOME/.config/sway/config.d/idle-manager"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/keybindings" "$HOME/.config/sway/config.d/keybindings"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/notification-daemon" "$HOME/.config/sway/config.d/notification-daemon"
handle_file_ln "$HOME/.dotfiles/config/sway/env" "$HOME/.config/sway/env"
handle_file_ln "$HOME/.dotfiles/config/waybar/config" "$HOME/.config/waybar/config"
handle_file_ln "$HOME/.dotfiles/config/waybar/spotify.sh" "$HOME/.config/waybar/spotify.sh"
handle_file_ln "$HOME/.dotfiles/config/waybar/style.css" "$HOME/.config/waybar/style.css"
handle_file_ln "$HOME/.dotfiles/config/zathura/zathurarc" "$HOME/.config/zathura/zathurarc"
handle_file_ln "$HOME/.dotfiles/fzf-plugins/history-exec.bash" "$HOME/.fzf-plugins/history-exec.bash"
handle_file_ln "$HOME/.dotfiles/gitconfig" "$HOME/.gitconfig"
handle_file_ln "$HOME/.dotfiles/inputrc" "$HOME/.inputrc"
handle_file_ln "$HOME/.dotfiles/install.sh" "$HOME/.install.sh"
handle_file_ln "$HOME/.dotfiles/latexmkrc" "$HOME/.latexmkrc"
handle_file_ln "$HOME/.dotfiles/LICENSE" "$HOME/.LICENSE"
handle_file_ln "$HOME/.dotfiles/local/bin/bing-wallpaper" "$HOME/.local/bin/bing-wallpaper"
handle_file_ln "$HOME/.dotfiles/local/bin/ciprun" "$HOME/.local/bin/ciprun"
handle_file_ln "$HOME/.dotfiles/local/bin/cmdlist" "$HOME/.local/bin/cmdlist"
handle_file_ln "$HOME/.dotfiles/local/bin/extract" "$HOME/.local/bin/extract"
handle_file_ln "$HOME/.dotfiles/local/bin/fzf-open" "$HOME/.local/bin/fzf-open"
handle_file_ln "$HOME/.dotfiles/local/bin/is-mosh" "$HOME/.local/bin/is-mosh"
handle_file_ln "$HOME/.dotfiles/local/bin/launcher" "$HOME/.local/bin/launcher"
handle_file_ln "$HOME/.dotfiles/local/bin/on-lid-close" "$HOME/.local/bin/on-lid-close"
handle_file_ln "$HOME/.dotfiles/local/bin/power" "$HOME/.local/bin/power"
handle_file_ln "$HOME/.dotfiles/local/bin/scratchterm" "$HOME/.local/bin/scratchterm"
handle_file_ln "$HOME/.dotfiles/local/bin/snip" "$HOME/.local/bin/snip"
handle_file_ln "$HOME/.dotfiles/local/bin/sway-run" "$HOME/.local/bin/sway-run"
handle_file_ln "$HOME/.dotfiles/local/bin/update-hosts" "$HOME/.local/bin/update-hosts"
handle_file_ln "$HOME/.dotfiles/local/bin/update-nvim" "$HOME/.local/bin/update-nvim"
handle_file_ln "$HOME/.dotfiles/local/bin/update-wallpaper" "$HOME/.local/bin/update-wallpaper"
handle_file_ln "$HOME/.dotfiles/profile" "$HOME/.profile"
handle_file_ln "$HOME/.dotfiles/pythonrc" "$HOME/.pythonrc"
handle_file_ln "$HOME/.dotfiles/rcrc" "$HOME/.rcrc"
handle_file_ln "$HOME/.dotfiles/ssh/config" "$HOME/.ssh/config"
handle_file_ln "$HOME/.dotfiles/tmux.conf" "$HOME/.tmux.conf"
handle_file_ln "$HOME/.dotfiles/tmux-keybindings.conf" "$HOME/.tmux-keybindings.conf"
handle_file_ln "$HOME/.dotfiles/vimrc" "$HOME/.vimrc"
