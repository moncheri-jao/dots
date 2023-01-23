setxkbmap -option "shift:both_capslock"
setxkbmap -option "caps:backspace"
xmodmap -e "keycode 66 = BackSpace BackSpace BackSpace"
