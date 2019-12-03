# If you come from bash you might have to change your $PATH.
export PATH=$HOME/Library/Python/2.7/bin:$HOME/bin:/usr/local/bin:/opt/puppetlabs/bin/:/opt/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="honukai/honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# source ~/.zsh-extras/zsh-histdb/sqlite-history.zsh
# source ~/.zsh-extras/zsh-histdb/history-timer.zsh
# autoload -Uz add-zsh-hook
# add-zsh-hook preexec _start_timer
# add-zsh-hook precmd  _stop_timer
source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# vi-like control of the cli
set -o vi
# adding additional path completions for zsh
fpath=(/usr/local/share/zsh-completions $fpath)

export EDITOR=vim

# convenience!
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias vim='vim -O'
bindkey '^R' history-incremental-search-backward
bindkey -v

# Operations
alias tfplan='terraform plan -out=.tfplan -refresh=false'
alias tffreshplan='terraform plan -out=.tfplan'
alias tfapply='terraform apply .tfplan; rm .tfplan'
alias evim='eyaml edit -n gpg'
alias galaxy=ansible-galaxy

# macOS misgivings in crontab contexts
if [[ $(uname) == 'Darwin' ]]; then
  alias crontab="VIM_CRONTAB=true crontab"
  export PATH=/usr/local/sbin:$PATH
fi

# work-specific stuff
if [[ $(hostname) == 'RBH12228' ]]; then
  alias hopslam="ssh mburling@172.22.0.66"
  alias devhop="ssh mburling@172.22.2.176"
  alias imphop="ssh mburling@172.22.15.10"
  alias toolshop="ssh 172.22.3.137"
  alias dev='cd $HOME/dev/'
  alias os-dev="source ~/.openrc/devqa-openrc.sh"
  alias os-prod="source ~/.openrc/prodops_stp1"
  alias os-tech="source ~/.openrc/techops-openrc.sh"
  alias os-tools="source ~/.openrc/tools_admin"
fi

# historical alacritty nonsense
# alias restart="ps aux | grep alacritty | awk '{ print $1 }' | xargs echo"
#Worthless text
