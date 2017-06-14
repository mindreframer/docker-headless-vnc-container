#!/usr/bin/env bash
### every exit != 0 fails the script
set -e


# apt-get install sakura -y # terminal

apt-get install rxvt-unicode-256color ncurses-term -y
apt-get install git-core tmux curl -y