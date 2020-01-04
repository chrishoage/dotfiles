#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# set up and order displays

#xrandr --output DP-1 --mode 2560x1440 --rate 120 --left-of eDP-1 \
#       --output DP-2 --left-of DP-1 \
#       --output eDP-1 --mode 1440x900

autorandr -c # detect display profile and change to it

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#remap caps lock to control
setxkbmap -option 'caps:ctrl_modifier'

# load fonts
if [ -d ~/.fonts ]; then
  xset +fp ~/.fonts
  xset fp rehash
fi

wal --theme gatito -a 80 -o $HOME/.config/wal/done.sh

#set wallpaper
feh --bg-fill ~/.wallpapers/blue-red-poly.jpg &

urxvtd &

# use a normal cursor
xsetroot -cursor_name left_ptr &

# sleep display after 5 minutes
xset dpms 0 0 300

#wm
compton &
light-locker &
redshift-gtk &
exec bspwm
