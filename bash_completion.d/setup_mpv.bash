_mpv_use_media_globexpr=1
_mpv_media_globexpr='@(mkv)'
if [ ! -f $HOME/.bash_completion.d/mpv-completion.bash ]; then
  wget -q https://raw.githubusercontent.com/2ion/mpv-bash-completion/master/gen.lua \
    -O /tmp/gen.lua
  chmod +x /tmp/gen.lua
  /tmp/gen.lua > $HOME/.bash_completion.d/mpv-completion.bash
  rm /tmp/gen.lua
fi
source $HOME/.bash_completion.d/mpv-completion.bash
