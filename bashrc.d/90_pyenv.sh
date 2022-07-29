#!/bin/bash

# Setup Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
if [ -x "$(command -v virtualenvwrapper.sh)" ]; then
  source virtualenvwrapper_lazy.sh
fi

# Setup mambaforge if found; this isn't done lazily, so expect some bash starup delay
__conda_setup=$("$HOME/mambaforge/bin/conda" 'shell.bash' 'hook' 2>/dev/null)
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/mambaforge/etc/profile.d/conda.sh" ]; then
    . "$HOME/mambaforge/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/mambaforge/bin:$PATH"
  fi
fi
unset __conda_setup

# Matplotlib with qt backend by default
export MPLBACKEND=qt5agg
