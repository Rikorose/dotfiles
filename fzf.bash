# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hendrik/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/hendrik/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hendrik/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/hendrik/.fzf/shell/key-bindings.bash"
