# Completion for pdf files
_pdf()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  COMPREPLY=( $( compgen -o plusdirs  -f -X '!*.pdf' -- $cur ) )
}
complete -o filenames -F _pdf pdf
# Complete swayexec alias with executables and files
_swayexec()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  COMMANDS=$(cmdlist)
  COMPREPLY=( $( compgen -W "$COMMANDS" -f -- $cur ) )
}
complete -F _swayexec -o bashdefault -o default 'swayexec'

# Complete mpv, git, and aliases
for bcfile in ~/.bash_completion.d/* ; do
  . $bcfile
done

# Complete exa
complete -F _complete_alias ls
complete -F _complete_alias ll
