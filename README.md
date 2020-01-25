# dotfiles
Development Environment Setup


## ArchLinux

### Remap Caps-Lock to Escape
```bash
pacman -S setxkbmap

```
add the command before the `exec gnome-session`: `setxkbmap -option caps:escape`

### Tools

```bash
pacman -S alacritty 
neovim 
tmux 
ctags 
powerline 
python
python-pip
python2
ruby 
nodejs 
npm 
yarn
# code-searching tool - https://github.com/ggreer/the_silver_searcher
pacman -S the_silver_searcher

# command-line fuzzy finder - https://github.com/junegunn/fzf
pacman -S fzf
```

### global npm packages
```bash

```

### 

### Fonts using [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

```bash
git clone https://github.com/ryanoasis/nerd-fonts
./install.sh Hack
```

## oh-my-zsh

### Theme [Powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)
```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

### [syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```




## neovim

plugin manager [vim-plug](https://github.com/junegunn/vim-plug)

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## tmux

### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


