# completion for opening man pages with nvim
if [ -f /usr/share/bash-completion/completions/man ]; then
  source /usr/share/bash-completion/completions/man
  complete -o default -o nospace -F _man vman
fi
