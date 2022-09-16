#!/bin/bash


VIMRC="$HOME/.config/nvim/settings.vimrc"
ALACRITTY="$HOME/.config/alacritty"

if [[ "$1" = "dark" ]]; then
  echo "Switch to DARK theme"
  ln -sf "$ALACRITTY/alacritty-dark.yml" "$ALACRITTY/alacritty.yml"
  sed -i '.bak' 's/set background=light/set background=dark/g' $VIMRC
elif [[ "$1" = 'light' ]]; then
  echo "Switch to LIGHT theme"
  ln -sf "$ALACRITTY/alacritty-light.yml" "$ALACRITTY/alacritty.yml"
  sed -i '.bak' 's/set\ background=dark/set\ background=light/g' $VIMRC
else
  echo "Theme $1 not supported"
fi
