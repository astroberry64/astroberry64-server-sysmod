#!/bin/bash

INFO="<big><b>Welcome to Astroberry64 Server!</b></big>\n
You are only one step from using Astrobery Server.\n
Review your system configuration and make necessary changes. Make sure to choose your localisation.\n
If you skip this step you can run it anytime from <b>Menu / Preferences / Raspberry Pi Configuration</b>\n
Project home page is located at <a href=''>www.astroberry.io</a>"

if [ -n "$(grep '^astroberry64-init.sh' /etc/xdg/lxsession/LXDE-astroberry/autostart)" ]
then
    zenity --title "Astroberry64 Server" --width=400 --height=300 --info --text="$INFO" --icon-name="start-here"
    env SUDO_ASKPASS=/usr/lib/rc-gui/pwdrcg.sh sudo -AE rc_gui
    sudo -AE sed -i "s/^astroberry64-init.sh/#astroberry64-init.sh/g" /etc/xdg/lxsession/LXDE-astroberry/autostart
fi
