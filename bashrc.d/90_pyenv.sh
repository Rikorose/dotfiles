#!/bin/bash

export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Setup Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
if [ -x "$(command -v virtualenvwrapper.sh)" ]; then
  source virtualenvwrapper_lazy.sh
fi

# Setup mambaforge if found; this isn't done lazily, so expect some bash starup delay
if [ -d "$HOME/micromamba" ]; then
  export MAMBA_EXE="$HOME/.local/bin/micromamba"
  export MAMBA_ROOT_PREFIX="$HOME/micromamba"
  __mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
  else
    alias micromamba="$MAMBA_EXE" # Fallback on help from mamba activate
  fi
  unset __mamba_setup
fi

if [ -d "$HOME/miniforge" ]; then
  __conda_setup="$($HOME/miniforge/bin/conda shell.bash hook >/dev/null)"
  eval "$__conda_setup"
  unset __conda_setup
fi


# >>> conda initialize >>>
__conda_setup="$('$HOME/miniforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


alias poetry_activate="source \"\$(poetry env list --full-path | grep Activated | cut -d' ' -f1 )/bin/activate\""
alias poetry_activate_dfn="source \"\$(poetry -C DeepFilterNet env list --full-path | grep Activated | cut -d' ' -f1 )/bin/activate\""
# /alias poetry_activate_dfn="source $(poetry -C DeepFilterNet env list --full-path)/bin/activate"

# Matplotlib with qt backend by default
export MPLBACKEND=qt5agg
