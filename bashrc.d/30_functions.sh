#!bash

## Helper functions
dirname() {
  # Usage: dirname "path"
  printf '%s\n' "${1%/*}/"
}
basenames() {
  # Usage: basename "path"
  # basename without suffix
  f="$(basename $1)"
  printf '%s\n' "${f%.*}"
}
