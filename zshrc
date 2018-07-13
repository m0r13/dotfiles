hostname=$(hostname)

# autostart x on tty1
if [[ ("$hostname" = "moritz-laptop" || "$hostname" = "moritz-desktop") && -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

#if [[ "$hostname" = "moritz-desktop" ]]; then
#    has_powerline=true
#else
#    has_powerline=false
#fi
has_powerline=false

export EDITOR=vim

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aussiegeek"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(battery git ssh-agent)
zstyle :omz:plugins:ssh-agent identities id_rsa

source $ZSH/oh-my-zsh.sh

alias tmux="tmux -2"
alias ssh="TERM=rxvt ssh"

if $has_powerline; then
    source /usr/share/zsh/site-contrib/powerline.zsh
fi

# Customize to your needs...
export PATH=$PATH:~/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/kde/bin:/usr/bin/vendor_perl:/usr/bin/core_perl
export PYTHONPATH=$PYTHONPATH:~/python-packages
