# .profile

# Java under wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# User specific environment and startup programs
export HISTIGNORE=$HISTIGNORE,fg

export PATH="$HOME/.local/bin:$PATH"

# Setup Virtualenvwrapper
export VIRTUALENV_PYTHON=python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
if [ -x "$(command -v virtualenvwrapper.sh)" ]; then
  source virtualenvwrapper.sh
fi

# Python shell auto completion
export PYTHONSTARTUP=~/.pythonrc