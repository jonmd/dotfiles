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