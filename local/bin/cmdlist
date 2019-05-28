#!/bin/sh
echo -n "$PATH" | xargs -d: -I{} -r -- fd -L --max-depth 1 --type executable . {} | sort -u
