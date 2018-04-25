#!/bin/bash

# start user dbus session
systemctl --user start dbus

#eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

# set keyboard layout (de)
export XKB_DEFAULT_LAYOUT=de
export XKB_DEFAULT_VARIANT=nodeadkeys
export XKB_DEFAULT_OPTIONS=caps:escape

sway --verbose > /tmp/sway.log 2>&1
