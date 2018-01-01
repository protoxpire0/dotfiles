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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

compton &
/bin/sh ~/.config/feh/rotate.sh &
exec i3 -V >> ~/.i3logs/i3log-$(date +'%F-%k-%M-%S') 2>&1
xinput --set-prop 11 'libinput Accel Speed' -0.8 &

if [[ -n ${DISPLAY} ]]; then

  # set your devices names here
  pointer1="Game mouse"

  id1=$(xinput | awk -F= "/$pointer1.*pointer/ {print \$2}" | cut -f1)

  if [[ -n "${id1}" ]]; then
    xinput set-prop "${id1}"  "libinput Accel Speed" -0.8 
  fi
fi

