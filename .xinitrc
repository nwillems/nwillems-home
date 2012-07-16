#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# trayer 

setxkbmap dk
xsetroot -cursor_name left_ptr 
xloadimage -onroot /home/nwillems/wallpapers/nwbg.jpg

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec ck-launch-session xmonad
