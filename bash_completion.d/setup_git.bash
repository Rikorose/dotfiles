GIT_COMPLETION_FILE="$HOME/.bash_completion.d/git-completion.bash"

if [ -f /usr/share/doc/git/contrib/completion/git-completion.bash ]; then
  source /usr/share/doc/git/contrib/completion/git-completion.bash
else
  if [ ! -f $GIT_COMPLETION_FILE ]; then
    wget -q https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
      -O $GIT_COMPLETION_FILE
  fi
  source $GIT_COMPLETION_FILE
fi
alias g='git'
__git_complete g __git_main
