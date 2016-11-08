#!/bin/bash

##################
# export options #
##################

export EDITOR='vim'
export GREP_OPTIONS='--color=auto'

# Don't store commands prepended with ' ' (space) in history
export HISTCONTROL=ignorespace

##########
# Prompt #
##########

# color palette
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

# Prompt declaration
export PS1="${LIGHT_RED}➜ ${LIGHT_GREY}"

########
# PATH #
########

# /usr/local/bin as primary (and include corresponding sbin)
PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH

export WORKON_HOME=~/.virtualenvs
source virtualenvwrapper.sh
