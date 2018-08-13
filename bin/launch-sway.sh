#!/bin/bash

# start user dbus session
systemctl --user start dbus

# set keyboard layout (de)
export XKB_DEFAULT_LAYOUT=de
export XKB_DEFAULT_VARIANT=nodeadkeys
export XKB_DEFAULT_OPTIONS=caps:escape

sway --verbose > /tmp/sway.log 2>&1
