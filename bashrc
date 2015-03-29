#!/usr/local/bin/bash

############################
# aliases & export options #
############################

# Colored ls
alias ls='ls -G'
alias ll='ls -Ghla'

alias home='cd ~'
alias up='cd ..'

alias athena='ssh athena.dialup.mit.edu -l pcattori'

export EDITOR='vim'

# view man pages with vim
export MANPAGER="col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -"

# -E for extended regex
#alias sed='sed -E'
#export GREP_OPTIONS='-E --color=auto'
export GREP_OPTIONS='--color=auto'

# Don't store commands prepended with ' ' (space) in history
export HISTCONTROL=ignorespace

#########################
# convenience functions #
#########################

# command-line chrome : try file, then try url
function chrome {
    if !( open -a "Google Chrome" $1 2> /dev/null ); then
        open -a "Google Chrome" "http://$1"
    fi
}

##########
# Prompt #
##########

BLACK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
BROWN='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
PURPLE='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
LIGHT_GREY='\[\e[0;37m\]'
DARK_GREY='\[\e[1;30m\]'
LIGHT_RED='\[\e[1;31m\]'
LIGHT_GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
LIGHT_BLUE='\[\e[1;34m\]'
LIGHT_PURPLE='\[\e[1;35m\]'
LIGHT_CYAN='\[\e[1;36m\]'
WHITE='\[\e[1;37m\]'

# git branch information for prompt
git_branch() {
    git branch 2> /dev/null | sed -E -e '/^[^*]/d' -e 's/.* (.*)/ \(\1\)/'
}

# Prompt declaration
export PS1="$CYAN\u$BLACK : $BLUE\W$LIGHT_PURPLE\$(git_branch)$RED ∴ $LIGHT_GREY"

########
# PATH #
########

# Homebrew: /usr/local/bin as primary (and include corresponding sbin)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
