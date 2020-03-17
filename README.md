# dotfiles

## TL;DR

Install packages, clone repo, and set up links to configuration files in `$HOME`.

```
sudo apt install i3 i3status dmenu compton rxvt-unicode-256color \
         fonts-font-awesome lxappearance
git clone git@gitlab.com:jonmd/dotfiles
cd dotfiles
./install.sh
```

## i3 with compton

```
apt install i3 i3status dmenu compton
```

## urxvt / rxvt-unicode

```
apt install rxvt-unicode-256color
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

## Ubuntu 18.04 and newer

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
