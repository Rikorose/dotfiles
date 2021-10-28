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
