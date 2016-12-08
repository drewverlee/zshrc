
CURRENT_DIR="${PWD##*/}"
# Path to your oh-my-zsh installation.
export ZSH=/Users/drewverlee/.oh-my-zsh

# run from root of ansible playbook
export ANSIBLE_CONFIG="$PWD/configs/development.cfg"
# example use
#
# ansible-vault view group_vars/dev-servers/vault.yml

#export GOPATH=/Users/drewverlee/personal/ds/6824/6.824
#

# CPATH="/usr/src/app"
# CONTAINER_PATH="drewverlee/$CURRENT_DIR"
# alias dlocal="docker run -v $PWD:$CPATH $CONTAINER"
# alias dl="docker run -it -v $PWD:$CPATH $CONTAINER"
# alias dbuild="docker build -t $CONTAINER ."
# alias dr="docker build -t drewverlee/$CURRENT_DIR . && docker run --rm --name $CURRENT_DIR drewverlee/$CURRENT_DIR"

# alias dps="docker rm $(docker ps -a -q)"

export GOPATH=~/go

# java
#
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/opt/apache-maven-3.3.9/bin:$PATH
# export PATH=~/.local/bin



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# aliases for loggint in
alias ssh_dc_db="ssh -NL 5433:postgres0-db.dc.res0.local:5432 webapp0.dc.res0.local &"
alias ssh_dc_db1="ssh -NL 5433:postgres1-db.dc.res0.local:5432 webapp1.dc.res0.local &"
alias ssh_sc_db="ssh -L 5433:postgres0-db.sc.res0.local:5432 webapp0.sc.res0.local"
# not sure this still works
alias ssh_dc_tsd2="ssh  -L 4242:tsd0.dc.res0.net:80 webapp0.dc.res0.local"

#todo list
source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion complete -F _todo t

alias t='/usr/local/Cellar/todo-txt/2.10/bin/todo.sh -d $HOME/Dropbox/todo/todo.cfg'


# virtural wrapp
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# export WORKON_HOME=~/virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh


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
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# thsi was complaning
#
#
export PATH="$PATH:/Users/drewverlee/.rvm/gems/ruby-2.3.1-p643/bin:/Users/drewverlee/.rvm/gems/ruby-2.3.1-p643@global/bin:/Users/drewverlee/.rvm/rubies/ruby-2.3.1-p643/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/drewverlee/.rvm/bin:/Applications/Postgres.app/Contents/Versions/latest/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#  vim
bindkey -v

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/(vicmd|opp)/$VIM_PROMPT}/(main|viins)/}"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char   
bindkey "^U" kill-line     
bindkey '^R' history-incremental-search-backward

export PATH="/usr/local/mysql/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/drewverlee/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/drewverlee/Downloads/google-cloud-sdk/completion.zsh.inc'

#resoulte alises
alias godev='export ANSIBLE_CONFIG=/Users/drewverlee/maddog/resolute-deploy-automation/ansible-playbook/configs/development.cfg'
alias gostg='export ANSIBLE_CONFIG=/Users/drewverlee/maddog/resolute-deploy-automation/ansible-playbook/configs/staging.cfg'

alias cptest='rake db:test:prepare RAILS_ENV=test && rake spec RAILS_ENV=test'
