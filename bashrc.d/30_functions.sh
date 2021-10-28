#!bash

function d ()
{
  git diff "$@" | delta --side-by-side
}
# Also overwrite dc (cmd calculator) since the usage is pritty meh anyways
function dc ()
{
  git diff --cached "$@" | delta --side-by-side
}

isgitdir()
{
  if [ -z $1 ]; then
    DIR=$PWD
  else
    DIR=$1
  fi
  git -C "$DIR" rev-parse 2>/dev/null
}
