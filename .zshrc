# export TERM="xterm-256color"
# export TERM="screen-256color"
export ZSH="/Users/xac/.oh-my-zsh"				 # Path to your oh-my-zsh installation

### theme ######################################################################

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( vi_mode )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( status command_execution_time )
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false

# Vi-Mode
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='116'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='24'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='142'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='22'

export FZF_DEFAULT_OPTS='--bind ctrl-J:down,ctrl-K:up'

### theme ######################################################################

### plugins ####################################################################
plugins=(
  brew
  common-aliases
  docker
  docker-compose
  git
  git-extras
  node
  npm
  npx
  yarn
  osx
  tmux
  vi-mode
  zsh-syntax-highlighting
  history-substring-search
  z
)

#################################################################### plugins ###
source $ZSH/oh-my-zsh.sh

DISABLE_UNTRACKED_FILES_DIRTY="true"    # faster repo status check by disabling marking untracked files
HISTSIZE=1000                           # commands history
SAVEHIST=1000
HISTFILE=~/.config/omz/zsh_history

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR="$VISUAL"
export SSH_KEY_PATH="~/.ssh/rsa_id"
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

### zsh-users ##################################################################
# autoload -U compinit && compinit
## completion stuff
zstyle ':compinstall' filename '$HOME/.zshrc'

zcachedir="$HOME/.zcache"
[[ -d "$zcachedir" ]] || mkdir -p "$zcachedir"

_update_zcomp() {
    setopt local_options
    setopt extendedglob
    autoload -Uz compinit
    local zcompf="$1/zcompdump"
    # use a separate file to determine when to regenerate, as compinit doesn't
    # always need to modify the compdump
    local zcompf_a="${zcompf}.augur"

    if [[ -e "$zcompf_a" && -f "$zcompf_a"(#qN.md-1) ]]; then
        compinit -C -d "$zcompf"
    else
        compinit -d "$zcompf"
        touch "$zcompf_a"
    fi
    # if zcompdump exists (and is non-zero), and is older than the .zwc file,
    # then regenerate
    if [[ -s "$zcompf" && (! -s "${zcompf}.zwc" || "$zcompf" -nt "${zcompf}.zwc") ]]; then
        # since file is mapped, it might be mapped right now (current shells), so
        # rename it then make a new one
        [[ -e "$zcompf.zwc" ]] && mv -f "$zcompf.zwc" "$zcompf.zwc.old"
        # compile it mapped, so multiple shells can share it (total mem reduction)
        # run in background
        zcompile -M "$zcompf" &!
    fi
}
_update_zcomp "$zcachedir"
unfunction _update_zcomp


bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bindkey -M vicmd 'n' nvim .
################################################################## zsh-users ###
### java #######################################################################

# Manage your Java environment [jEnv](https://www.jenv.be/)
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

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

# export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$HOME/Library/Python/3.7/bin:$PATH"

##################################################################### python ###
### Rust #######################################################################

export PATH="$HOME/.cargo/bin:$PATH"

####################################################################### rust ###
### chromium ###################################################################

# disable google api for chromium:
export GOOGLE_API_KEY="no"
export GOOGLE_DEFAULT_CLIENT_ID="no"
export GOOGLE_DEFAULT_CLIENT_SECRET="no"

################################################################### chromium ###
### brew #######################################################################

export HOMEBREW_GITHUB_API_TOKEN=XXX
export PATH="/usr/local/sbin:$PATH"

####################################################################### brew ###
### cocoapods ##################################################################

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

################################################################## cocoapods ###
### chruby #####################################################################
# source /usr/local/opt/chruby/share/chruby/auto.sh
##################################################################### chruby ###

### aliases ####################################################################
. ~/.config/omz/zsh_aliases


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

