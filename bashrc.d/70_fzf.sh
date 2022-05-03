#!/bin/bash

# fzf keybindings
export FZF_DEFAULT_COMMAND='fd --type f --follow'
export FZF_TMUX=0
export FZF_CTRL_R_EDIT_KEY=ctrl-e
export FZF_CTRL_R_EXEC_KEY=enter
export FZF_CTRL_T_COMMAND='fd --follow'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
elif [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  source /usr/share/fzf/shell/key-bindings.bash
fi
# if [ -f ~/.fzf-plugins/history-exec.bash ]; then
#   source ~/.fzf-plugins/history-exec.bash
# fi
