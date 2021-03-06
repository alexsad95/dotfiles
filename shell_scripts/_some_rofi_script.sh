#!/bin/zsh
r=(rofi -dmenu -markup-rows -format d -width -15)
rt() {
    local u a s=() i=0 p=(-l $((#/3)))
    for t k c in $@ ; do
        eval $k[2]${k[2]:++=$i,} ; k[2]=$k[1]:u
        (( 1 < (j=t[(i)[$k]]) && j <= $#t )) && t[j]="<u>$t[j]</u>"
        s+=$t p+=(-kb-select-$((++i)) $k[1])
    done
    i=`$r $p ${u:+-u} $u ${a:+-a} $a <<< ${(F)s}` && eval $@[i*3] \&
}

#   title           key command
ap=(Terminal        t   urxvtc
    Calculator      c   galc
    Calendar        l   galen
    TeXstudio       x   texstudio
    Mathematica\ 11 mu  ~/.mathematica/Mathematica
    Other           oa  genu\ ot
    Internet        ia  genu\ it)

ot=(Disks           da  gnome-disks
    GParted         ga  gparted
    Baobab          b   baobab
    Evince          e   evince
    Sims\ 4         iu  ~/.Downloads/Sims_4_Linux/start.sh
    Steam           s   steam)

it=(Firefox         f   firefox\ --private-window
    Tor             t   tor-browser
    Telegram        g   telegram-desktop
    Transmission    r   transmission-gtk)

ex=(Shutdown        wu  systemctl\ poweroff
    Reboot          ru  systemctl\ reboot
    Suspend         sa  systemctl\ suspend
    Lock            l   glock
    Reload\ i3      e   'i3-msg reload && dunstify i3:\ reload!'
    Restart\ i3     t   i3-msg\ restart
    Config\ i3      c   gedit\ ~/.config/i3/config)

rt ${(P)1}