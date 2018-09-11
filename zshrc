###########
# plugins #
###########

# initialize zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# let zplug manage itself
zplug "zplug/zplug"

# completion
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", defer:2 # fish-style auto-suggestions

# other
zplug "plugins/wd", from:oh-my-zsh # new `jump`
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

##########
# prompt #
##########

PROMPT="❯ "

###########
# aliases #
###########

alias ls='ls -GFh'
alias lal='ls -GFhAl'
alias lv='ls -1'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'

############
# settings #
############

export EDITOR=vim

export HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# TODO maybe use default logging, but custom up-arrow searching?
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'
setopt HIST_IGNORE_ALL_DUPS

# tab menu traversal
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

bindkey "^R" history-incremental-pattern-search-backward

# emacs-style editing on cli
bindkey -e

# edit command with `<ctrl-x><ctrl-e>`
autoload edit-command-line; zle -N edit-command-line
bindkey "^X^E" edit-command-line

# homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH
