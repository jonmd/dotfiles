#!/usr/bin/env bash

set -e

# Get current directory
DOTFILES="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# .Xdefaults
if [ ! -f "$HOME/.Xdefaults" ]; then
    ln -sT "$DOTFILES/Xdefaults" "$HOME/.Xdefaults"
fi

# .i3/
if [ ! -d "$HOME/.i3" ]; then
    ln -sT "$DOTFILES/i3" "$HOME/.i3"
fi

# .config/i3status
if [ ! -d "$HOME/.config/i3status" ]; then
    mkdir -p "$HOME/.config"
    ln -sT "$DOTFILES/config/i3status" "$HOME/.config/i3status"
fi

# .config/rofi
if [ ! -d "$HOME/.config/rofi" ]; then
    mkdir -p "$HOME/.config"
    ln -sT "$DOTFILES/config/rofi" "$HOME/.config/rofi"
fi

# .vimrc
if [ ! -f "$HOME/.vimrc" ]; then
    ln -sT "$DOTFILES/vimrc" "$HOME/.vimrc"
fi

# .vim/
if [ ! -d "$HOME/.vim" ]; then
    ln -sT "$DOTFILES/vim" "$HOME/.vim"
fi
