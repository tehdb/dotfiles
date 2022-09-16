#!/bin/bash

# https://brew.sh
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# https://formulae.brew.sh/formula/

# CLI Programs

# https://htop.dev
brew install htop

# https://www.gnu.org/software/wget/
brew install wget

# Terminal multiplexer - https://github.com/tmux/tmux/wiki
brew install tmux

# Tmux sessions manager - https://github.com/tmuxinator/tmuxinator
brew install tmuxinator

# Reattach process (e.g., tmux) to background - https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
brew install reattach-to-user-namespace

# JavaScript runtime - https://nodejs.org/en/ 
brew install node

# https://www.ruby-lang.org/
brew install ruby

brew install python

pip3 install --upgrade powerline-status


# command-line fuzzy finder - https://github.com/junegunn/fzf
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Search tool - https://github.com/BurntSushi/ripgrep
brew install ripgrep

# Additional completion definitions for Zsh - https://github.com/zsh-users/zsh-completions
brew install zsh-completions

# History search - https://github.com/zsh-users/zsh-history-substring-search
brew install zsh-history-substring-search

# Syntax highlighting for Zsh - https://github.com/zsh-users/zsh-syntax-highlighting
brew install zsh-syntax-highlighting 

# Kubernetes command-line interface - https://kubernetes.io/
brew install kubernetes-cli

# Vim-based text editor - https://neovim.io/
brew install neovim

# Modern replacement for ls - https://the.exa.website
brew install exa

# CLI file manager - https://vifm.info
brew install vifm

# Display directories as trees - http://mama.indstate.edu/users/ice/tree/
brew install tree

# Fast file navigation - https://github.com/ajeetdsouza/zoxide
brew install zoxide

# Maintained ctags implementation - https://github.com/universal-ctags/ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# brew install broot

# Disk Usage - https://dev.yorhel.nl/ncdu
brew instal ncdu

# Mongo shell - https://github.com/mongodb-js/mongosh#readme 
brew install mongosh

# MySQL client - https://dev.mysql.com/doc/refman/5.7/en/
brew install mysql-client@5.7

# Image editor - https://imagemagick.org/index.php
brew install imagemagick 

# Command-line JSON processor - https://stedolan.github.io/jq/
brew install jq

# IDE Fonts - https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# GUI Programs

# GPU-accelerated terminal emulator - https://github.com/alacritty/alacritty/
brew install --cask alacritty

# Open-source screen recorder- https://getkap.co/
brew install kap

# Open-source BitTorrent client - https://transmissionbt.com/
brew install --cask transmission

