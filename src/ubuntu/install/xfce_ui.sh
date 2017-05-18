#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get install -y supervisor xfce4
# xterm
apt-get purge -y pm-utils xscreensaver*