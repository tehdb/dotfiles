# export TERM="xterm-256color"
# export TERM="screen-256color"
export ZSH="/Users/xac/.oh-my-zsh"				 # Path to your oh-my-zsh installation

### theme ######################################################################

ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs vi_mode)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status command_execution_time vcs )
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='116'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='24'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='142'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='22'

### theme ######################################################################
### plugins ####################################################################
plugins=(
  brew
  common-aliases
  docker
  docker-compose
  git
  git-extras
  gulp
  # history
  # node
  npm
  # npx
  yarn
  osx
  tmux
  vi-mode
  # vscode
  # zsh-completions
  zsh-syntax-highlighting
  history-substring-search
)

#################################################################### plugins ###
source $ZSH/oh-my-zsh.sh

DISABLE_UNTRACKED_FILES_DIRTY="true"    # faster repo status check by disabling marking untracked files
HISTSIZE=1000                           # commands history
SAVEHIST=1000
HISTFILE=~/.zsh_history

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR="$VISUAL"
export SSH_KEY_PATH="~/.ssh/rsa_id"
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

### zsh-users ##################################################################
autoload -U compinit && compinit
# source zsh-syntax-highlighting.zsh
# source zsh-history-substring-search.zsh

# bindkey '^[[5~' history-substring-search-up
# bindkey '^[[6~' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
################################################################## zsh-users ###
### java #######################################################################

# Manage your Java environment [jEnv](https://www.jenv.be/)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_OPTS="-Xms1024m -Xmx4096m -XX:+TieredCompilation -XX:TieredStopAtLevel=1"

####################################################################### java ###
### android ####################################################################

export ANDROID_HOME="/Users/xac/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

#################################################################### android ###
### ruby #######################################################################

export PATH="/usr/local/opt/ruby/bin:$PATH"
# for compilers to find ruby you may need to set:
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
# for pkg-config to find ruby you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

####################################################################### ruby ###
### python #####################################################################

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

##################################################################### python ###
### chromium ###################################################################

# disable google api for chromium:
export GOOGLE_API_KEY="no"
export GOOGLE_DEFAULT_CLIENT_ID="no"
export GOOGLE_DEFAULT_CLIENT_SECRET="no"

################################################################### chromium ###

### brew #######################################################################

export HOMEBREW_GITHUB_API_TOKEN=xxx

####################################################################### brew ###

### kitty ######################################################################
# autoload -Uz compinit
# compinit
# # Completion for kitty
# kitty + complete setup zsh | source /dev/stdin
###################################################################### kitty ###

# Aliases
. ~/.zsh_aliases

# Functions
#
# fpath+=${ZDOTDIR:-~}/.zsh_functions
# fpath=( ~/.zsh_functions "${fpath[@]}" )

# FPATH=~/.zsh_functions:$FPATH
# function xac() {
#   echo "xac is here"
# }

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
