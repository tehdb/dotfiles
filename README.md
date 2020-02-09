# dotfiles
Development Environment Setup

## ArchLinux

### Keyboard adjustments

#### Connect apple magic keyboard via bluetooth

```bash
pacman -S bluez-utilz bluez-hid2hci

# get the MAC address of the keyboard
bluetoothctl
[bluetooth]$ power on
[bluetooth]$ devices
Device xx:xx:xx:xx:xx:xx Apple Wireless Keyboard

# connect the keyboard to bluetooth
[bluetooth]$ agent KeyboardOnly
[bluetooth]$ default-agent
[bluetooth]$ pairable on
[bluetooth]$ pair xx:xx:xx:xx:xx:xx
[bluetooth]$ trust xx:xx:xx:xx:xx:xx
[bluetooth]$ connect xx:xx:xx:xx:xx:xx
```

#### Remap Caps-Lock to Escape and reposition Ctrl and Alt

```bash
# install and launch gnome tweaks tool
pacman -S gnome-tweaks
gnome-tweaks
```
`Keboard & Mouse` → `Additional Layout Options`
- `Caps Lock behavior` → `Make Caps Lock an additional Esc`
- (pc keyboard)
  - `Alt/Win key behavior` → `Ctrl is mapped to Alt; Alt is mapped to Win`
- (apple keyboard)
  - `Alt/Win key behavior` → `Disabled`
  - `Ctrl position` → `Swap Left Win with Left Ctrl`

#### Remap other keys

```bash
# find key code or name
xev -event keyboard

# create key map
xmodmap -pke > ~/.Xmodmap

# swap backtick to less key
# by replacing the value of keycode 94 (less)
# with the value from keycode 49 (grave)
```
> Will not work in (gnome) cuz it is applying its own keyboard settings and resetting custom modifications.
`cp /path/to/dotfiles/autostart/myxmod.desctop ~/.config/autostart/myxmod.desktop`

## Cross-platfrom Tools

### [Alacritty](https://github.com/alacritty/alacritty) · cross-platform, GPU-accelerated terminal emulator
- ArchLinux: `pacman -S alacritty`
- MacOS: `brew cask install alacritty`

### Typeface for source code [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

```bash
git clone https://github.com/ryanoasis/nerd-fonts
./install.sh Hack
```

Statusline plugin for vim, and provides statuslines and prompts for several other applications, including zsh, tmux etc...
- ArchLinux: `pacman -S powerline`
- MacOS: `brew install powerline`


### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) · framework for managing zsh configuration

#### Theme [Powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)
```bash
git clone https://github.com/bhilburn/powerlevel9k.git \
                 ~/.oh-my-zsh/custom/themes/powerlevel9k
```

#### [Syntax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


### [fzf](https://github.com/junegunn/fzf) · command-line fuzzy finder
- ArchLinux: `pacman -S fzf`

### [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) · code-searching tool
- ArchLinux: `pacman -S the_silver_searcher`

### [tmux](https://github.com/tmux/tmux) · terminal multiplexer
- ArchLinux: `pacman -S tmux`
- MacOS: `brew install tmux`

#### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

`pacman -S ctags`

`pacman -S python`
`pacman -S python-pip`
`pacman -S python2`
`pacman -S ruby`

## [Node.js®](https://nodejs.org/en/) · JavaScript runtime built on Chrome's V8 JavaScript engine

- ArchLinux: `pacman -S nodejs`
- MacOS: `brew install node`

### [npm]() - Node package manager
- ArchLinux: `pacman -S npm`
- MacOS: `brew install npm`

### [yarn]() - Node package manager
- ArchLinux: `pacman -S yarn`
- MacOS: `brew install yarn`

### global npm packages
- n
- typescript
...

## [neovim](https://neovim.io/) · hyperextensible Vim-based text editor
- ArchLinux: `pacman -S neovim`
- MacOS: `brew install neovim`

### Additional neovim tools
#### [neovim](https://www.npmjs.com/package/neovim) · Neovim client API and neovim remote plugin provider
- via npm: `npm i -g neovim`

### nvim plugin manager [vim-plug](https://github.com/junegunn/vim-plug)

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### [Docker](https://docs.docker.com/get-started/)
- ArchLinux:
  ```bash
  pacman -S docker
  pacman -S docker-compose
  systemctl start docker.service
  systemctl enable docker.service
  groupadd docker
  gpasswd -a $USER docker
  usermod -aG docker $USER
  newgrp docker
  docker info
  ```
### [Postman](https://learning.getpostman.com/docs/postman/api-documentation/documenting-your-api/) · Collaboration Platform for API Development

- ArchLinux GUI via [snapcraft](https://snapcraft.io/): `snap install postman`
- NodeJS CLI via [yarn](https://yarnpkg.com): `yarn global add newman --prefix /usr/local`


