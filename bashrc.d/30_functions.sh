#!bash

## Helper functions
basenames() {
  # Usage: basename "path"
  # basename without suffix
  f="$(basename $1)"
  printf '%s\n' "${f%.*}"
}

function d ()
{
  git diff "$@" | delta --side-by-side
}
# Also overwrite dc (cmd calculator) since the usage is pritty meh anyways
function dc ()
{
  git diff --cached "$@" | delta --side-by-side
}


man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  command man "$@"
}
