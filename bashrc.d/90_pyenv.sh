#!/bin/bash

# Setup Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
if [ -x "$(command -v virtualenvwrapper.sh)" ]; then
  source virtualenvwrapper_lazy.sh
fi

# Setup miniconda if found; this isn't done lazily, so expect some bash starup delay
__conda_setup="$('$HOME/miniconda/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/miniconda/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/miniconda/bin:$PATH"
  fi
fi
unset __conda_setup

# Matplotlib with qt backend by default
export MPLBACKEND=qt5agg
