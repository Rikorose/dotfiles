# .profile

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

if [ -x "$(command -v fuck)" ]; then
  eval $(thefuck --alias)
fi

# Python shell auto completion
export PYTHONSTARTUP=~/.pythonrc

# Gitlab access token
export GITLAB_PRIVATE_TOKEN=$(cat ~/.git5_cs_fau_token)

export HISTSIZE=5000
