# Setup fzf
# ---------
if [[ ! "$PATH" == */home/schroeter/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/schroeter/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/schroeter/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/schroeter/.fzf/shell/key-bindings.bash"
