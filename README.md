# dotfiles
Development Environment Setup


# Basic Setup

```bash
ssh-keygen -t rsa
```

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

### [Node.js®](https://nodejs.org/en/) · JavaScript runtime built on Chrome's V8 JavaScript engine
- ArchLinux: `pacman -S nodejs`
- MacOS: `brew install node`

#### [npm](https://www.npmjs.com) · Node package manager
- ArchLinux: `pacman -S npm`
- MacOS: `brew install npm`

#### [yarn](https://yarnpkg.com) · Node package manager
- ArchLinux: `pacman -S yarn`
- MacOS: `brew install yarn`

##### global node packages

> `npm i -g @angular/cli @ionic/cli @nestjs/cli greadme mdless mongo-express n node-gyp node-pre-gyp npmrc redis-commander typescript`

- [@angular/cli](https://www.npmjs.com/package/@angular/cli) · CLI tool for Angular
- [@ionic/cli](https://www.npmjs.com/package/@ionic/cli) · A tool for creating and developing Ionic Framework mobile apps
- [@nestjs/cli](https://www.npmjs.com/package/@nestjs/cli) · A command-line interface tool that helps you to initialize, develop, and maintain your Nest applications
- [@nrwl/cli](https://www.npmjs.com/package/@nrwl/cli) · Extensible Dev Tools for Monorepos
- [greadme](https://www.npmjs.com/package/greadme) · Locally preview your markdown in Browser with Github style
- [mdless](https://www.npmjs.com/package/mdless) · Viewing and paging through a markdown file with formatting
- [mongo-express](https://www.npmjs.com/package/mongo-express) · Web-based MongoDB admin interface
- [n](https://www.npmjs.com/package/n) · Node.js version management
- [node-gyp](https://www.npmjs.com/package/node-gyp) · Node.js native addon build tool
- [node-pre-gyp](https://www.npmjs.com/package/node-pre-gyp) · Node.js native addon binary install tool
- [npmrc](https://www.npmjs.com/package/npmrc) · Switch between different .npmrc files with ease and grace
- [redis-commander](https://www.npmjs.com/package/redis-commander) · Redis web-based management tool
- [typescript](https://www.typescriptlang.org/docs/home.html) · TypeScript is a language for application scale JavaScript development


### [ruby](https://www.ruby-lang.org/en/)
- ArchLinux: `pacman -S ruby`
- MacOS: `brew install ruby`

### [python](https://www.python.org/)
- ArchLinux: `pacman -S python pythin-pip`
- MacOS: `brew install python`

### [Alacritty](https://github.com/alacritty/alacritty) · cross-platform, GPU-accelerated terminal emulator
- ArchLinux: `pacman -S alacritty`
- MacOS: `brew cask install alacritty`

Statusline plugin for vim, and provides statuslines and prompts for several other applications, including zsh, tmux etc...
- ArchLinux: `pacman -S powerline`
- MacOS: `pip3 install --upgrade powerline-status`

### Typeface for source code [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

- ArchLinux:
```bash
git clone https://github.com/ryanoasis/nerd-fonts
./install.sh Hack
```

- MacOs:
https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
```bash
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```


### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) · Framework for managing zsh configuration

```bash
/Users/xac/.zshenv@ -> .zshrc
/Users/xac/.zshrc@ -> /Users/xac/.config/omz/zshrc
```

#### [Powerlevel9k Theme](https://github.com/Powerlevel9k/powerlevel9k)
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
- MacOS: `brew install fzf`

### [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) · code-searching tool
- ArchLinux: `pacman -S the_silver_searcher`
- MacOS: `brew install the_silver_searcher`

### [tmux](https://github.com/tmux/tmux) · terminal multiplexer
- ArchLinux: `pacman -S tmux`
- MacOS:
  - `brew install tmux`
  - `brew install reattach-to-user-namespace`

#### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

> tpm does not work with symlinked .tmux.conf file, the config file has to be
copied to the home directory

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp /path/to/dotfiles/config/tmux/tmux.conf ~/.tmux.conf
```

### [neovim](https://neovim.io/) · hyperextensible Vim-based text editor
- ArchLinux: `pacman -S neovim`
- MacOS: `brew install neovim`

#### Additional neovim tools

##### [ctags](http://ctags.sourceforge.net/)
- ArchLinux: `pacman -S ctags`
- MacOS: `brew install ctags`

> `cp /path/to/dotfiles/.ctags ~/.ctags`


##### [Nvim Node.js client and plugin host](https://neovim.io/node-client/)
- `npm i -g neovim`

##### [python client and plugin host for Nvim](https://pynvim.readthedocs.io/en/latest/)
- `pip3 install --upgrade pynvim`

##### [Ruby support for Neovim](http://rubydoc.info/gems/neovim)
- `gem install neovim`

#### nvim plugin manager [vim-plug](https://github.com/junegunn/vim-plug)

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
> Run |:checkhealth| inside neovim to see if your system is up-to-date

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


