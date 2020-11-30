# .profile

export PROMPT_DIRTRIM=2
export PS1='[\u@\h \w]\$ '

export EDITOR=nvim
export LANG=en_US.UTF-8
# export GDK_BACKEND=wayland

# Firefox with kde file picker
export GTK_USE_PORTAL=1

# User specific environment and startup programs
export HISTIGNORE=$HISTIGNORE,fg

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH:/var/lib/snapd/snap/bin"

# Python shell auto completion
export PYTHONSTARTUP=~/.pythonrc
