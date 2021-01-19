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

## Mouse sensitivity

Find the mouse with xinput and set the coordinate transformation matrix:

```
# Find the mouse
$ xinput --list --short
# Set half sensitivity
$ xinput --set-prop "<mouse name or id>" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1
```

