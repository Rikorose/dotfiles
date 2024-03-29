#!/bin/bash
# Completion for pdf files
_pdf() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  COMPREPLY=($(compgen -o plusdirs -f -X '!*.pdf' -- $cur))
}
complete -o filenames -F _pdf pdf
# Complete swayexec alias with executables and files
_swayexec() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  COMMANDS=$(cmdlist)
  COMPREPLY=($(compgen -W "$COMMANDS" -f -- $cur))
}
complete -F _swayexec -o bashdefault -o default 'swayexec'

# Complete mpv, git, and aliases
for bcfile in ~/.bash_completion.d/*; do
  . $bcfile
done

# Complete diff alias
_complete_diff() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  if ! isgitdir; then
    # COMPREPLY=($(compgen -o bashdefault -d -f -- $cur))
    compopt -o default; COMPREPLY=()
  elif [ "$PWD" == "$(git rev-parse --show-toplevel)" ]; then
    local W=$(git -C $PWD diff --name-only)
    COMPREPLY=($(compgen -W "$W" -- $cur))
  else
    local W=$(git -C $PWD diff --name-only --relative=$(basename $PWD))
    COMPREPLY=($(compgen -W "$W" -- $cur))
  fi
}
complete -F _complete_diff d
_complete_diff_cached() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  if [ "$PWD" == "$(git rev-parse --show-toplevel)" ]; then
    local W=$(git -C $PWD diff --name-only --cached)
  else
    local W=$(git -C $PWD diff --name-only --cached --relative=$(basename $PWD))
  fi
  COMPREPLY=($(compgen -W "$W" -- $cur))
}
complete -F _complete_diff_cached dc

# Complete flatpak-run
_flatpak_run() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  APPS=$(flatpak list --app --columns=app)
  COMPREPLY=($(compgen -W "$APPS" -f -- $cur))
}
complete -F _flatpak_run flatpak-run
