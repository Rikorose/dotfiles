#!bash

if [[ :$PATH: != *:"$HOME/.local/bin":* ]] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Turn on checkwinsize
shopt -s checkwinsize

. /etc/profile.d/bash_completion.sh
. /etc/profile.d/lang.sh
. /etc/profile.d/less.sh
. /etc/profile.d/PackageKit.sh
. /etc/profile.d/gmpopenh264.sh
. /etc/profile.d/flatpak.sh
. /etc/profile.d/vte.sh
. /etc/profile.d/which2.sh
