#!/bin/sh

[ -f $HOME/.profile ] && . $HOME/.profile
[ -f $HOME/.xprofile ] && . $HOME/.xprofile
exec bspwm
