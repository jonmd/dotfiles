#!/usr/bin/env bash

#
# Set a random wallpaper on each system load
#
# Requirements:
#  - feh command in PATH
#  - expects files in $HOME/wallpapers/
#  - all wallpapers must match filename "wallpaper-*.jpg"
#

# go to the directory where this script is stored
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR


# check if feh exists in PATH
FEH_EXEC="`which feh`"
echo "CMD feh: $FEH_EXEC"
if [ -z "$FEH_EXEC" ]; then
    exit 1
fi

# check that the wallpaper directory is synced
WP_DIR="$HOME/wallpapers"
echo "WP_DIR: $WP_DIR"
if [ ! -d "$WP_DIR" ]; then
    exit 2
fi

echo "listing wp"
# list all wallpapers
wallpapers=($WP_DIR/wallpaper-*.jpg)

# get a random one
selected="${wallpapers[RANDOM % ${#wallpapers[@]}]}"
echo "selected: $selected"

# set the randomly selected wallpaper as background (centered)
# DISPLAY-fix: https://bbs.archlinux.org/viewtopic.php?pid=415591#p415591
DISPLAY=:0 $FEH_EXEC --bg-center "$selected"
