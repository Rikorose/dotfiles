#!/bin/bash

# GO path and completion
export PATH="$HOME/.local/go/bin:$PATH"
if [ -x "$(command -v go)" ]; then
  export GOROOT=$(dirname $(dirname $(readlink -f $(command -v go))))
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
fi
