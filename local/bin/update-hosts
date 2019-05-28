#!/bin/bash

HOSTGIT=${1:-"$HOME/.hosts"}
if [ ! -d "$HOSTGIT" ]; then
  git clone https://github.com/StevenBlack/hosts "$HOSTGIT"
fi
cd "$HOSTGIT"
git reset --hard origin/master
git pull
sudo /usr/bin/env python3 updateHostsFile.py --auto --replace $2
