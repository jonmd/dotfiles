# dotfiles

## TL;DR

Install packages, clone repo, and set up links to configuration files in `$HOME`.

```
sudo apt install i3 i3status dmenu compton rxvt-unicode fzf \
         fonts-font-awesome lxappearance redshift redshift-gtk \
         flameshot speedcrunch rofi brightnessctl gsimplecal 
git clone git@gitlab.com:jonmd/dotfiles
cd dotfiles
./install.sh
```


## i3 with compton

```
apt install i3 i3status dmenu compton
```


## Adjust brightness

Install `brightnessctl`. By default it will only allow root to change the brightness,
but if you add your user to the `video` group you are allowed to use it:

```
apt install brightnessctl
usermod -aG video <user>
```


## Terminal: urxvt / rxvt-unicode

It used to be `rxvt-unicode-256color`, but now it's only `rxvt-unicode`:

```
apt install rxvt-unicode
```

### Swap out `ctrl` + `r` (fzf)

If you want to use the fzf package for autocomplete, you need to install it:

```
apt install fzf
```

Then update your `.bashrc` to use fzf:


```bash
# Append this line to ~/.bashrc to enable fzf keybindings for Bash:
source /usr/share/doc/fzf/examples/key-bindings.bash

# Append this line to ~/.bashrc to enable fuzzy auto-completion for Bash:
source /usr/share/doc/fzf/examples/completion.bash
```

### `.bash_history`

```bash
# How history is stored in bash
# ignoreboth: Remove white space at beginning and end
# erasedups: Don't write duplicates to the history file
export HISTCONTROL=ignoreboth:erasedups
```


## Fonts

Use **DejaVu Sans Mono** in terminal and **FontAwesome** (http://fontawesome.io) for
icons (there is a version in the Ubuntu package repo):

```
apt install fonts-font-awesome
```


## Adjust window theme

```
apt install lxappearance
```


## Ubuntu 20.04

You have to create a file with the name `/usr/share/xsessions/i3.desktop` (can be anything else, what is important is the **Name** property below). The contents should be like this:

```
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=i3
TryExec=i3
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
Keywords=tiling;wm;windowmanager;window;manager;
```


## Ubuntu 18.04

Ubuntu 18.04 uses Wayland by default. You may need to **disable Wayland** (to be able
to use X instead) for i3wm.

In the file **/etc/gdm3/custom.conf**, set `WaylandEnable` to `false`. Then remember
to **reboot**.

```
[daemon]
WaylandEnable=false
```


## Firefox theme

Install the Humble Gruvbox theme Mekeor Melire:

https://addons.mozilla.org/en-US/firefox/addon/humble-gruvbox



## Vim

After running `install.sh` (see above) to set up `.vimrc` and `.vim/`, start
vim and run the following to install plugins via Vundle:

```
:VundleInstall
```


## Virtualenv-wrapper

Disable virtualenv from modifing PS1 by appending the following line to your `.bashrc`:

```bash
# Virtualenv stuff
export VIRTUAL_ENV_DISABLE_PROMPT=1
```

Then update the `.virtualenvs/postactivate` file to create nice prompt:

```bash
#!/bin/bash
# This hook is sourced after every virtualenv is activated.

_OLD_VIRTUAL_PS1="$PS1"
if [ "x" != x ] ; then
    PS1="$PS1"
else
    PS1="\[\e[33m\]`basename \"$VIRTUAL_ENV\"`\[\e[0m\] $PS1"
fi
export PS1
```

Note that the params `\[ .. \]` allows you to write stuff that shouldn't be counted
towards line width in bash. That's why `\e[33m` in placed inside those parens, like so:
`\[\e[33m\]`.


## Show git branch

Add the following at the end of you `.bashrc`:

```bash
# Git branch
export PS1_ORIGINAL='$PS1'
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[34m\]$(__git_ps1 " %s ")\[\e[0m\]\$ '
```


## Remove duplicates from `.bash_history`

To remove duplicates from BASH history, set `erasedups` in `HISTCONTROL`. In addition,
you would also like to set `ignorespace:ignoredups` which `ignoreboth` does.

So set `HISTCONTROL` to the following in your `.bashrc` file (note: the option was
already defined in my `.bashrc` on Ubuntu 22.04 – you should probably overwrite it
there):

```bash
export HISTCONTROL=ignoreboth:erasedups
```


## Mouse sensitivity cli

```bash
# Find your mouse
$ xinput --list --short

# List properties for mouse
$ xinput --list-props <device id>

# Set mouse transformation matrix
# Example sets half speed, as the default is: [ 1 0 0   0 1 0   0 0 1 ]
$ xinput --set-prop "<device name>" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
```


## Don't turn off screen

```bash
$ xset s off
$ xset -dpms
$ xset s noblank
```


## Flameshot

Configuration file found in `.config/Dharkael/flameshot.ini`. If copy is not working,
run `flameshot config` and untick "Close after capture".


## Night mode (Redshift)

Use Redshift to turn on night mode (dim monitor with warmer/yellowish color).

 1. Place the config file in `~/.config/redshift.conf` (see file in this repo)
 2. Run `redshift-gtk` (added to startup in X1's i3wm config)

