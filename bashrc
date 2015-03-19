#!/usr/local/bin/bash

############################
# aliases & export options #
############################

# Colored ls
alias ls='ls -G'
alias ll='ls -Ghla'

alias home='cd ~'
alias up='cd ..'

# -E for extended regex
alias sed='sed -E'
alias athena='ssh athena.dialup.mit.edu -l pcattori'

export GREP_OPTIONS='-E --color=auto'
# Don't store commands prepended with ' ' (space) in history
export HISTCONTROL=ignorespace

#########################
# convenience functions #
#########################

# easy access to man pages for bash built-ins
function manbash {
   man -P "less +/\ \ \ $1" bash
}

# command-line chrome : try file, then try url
function chrome {
    if !( open -a "Google Chrome" $1 2> /dev/null ); then
        open -a "Google Chrome" "http://$1"
    fi
}

#######################
# Jump command module #
#######################

# TODO(pcattori): jump to subdir of mark
# Set ~/.marks as metadata dir
MARKPATH=$HOME/.marks

# Commands
function jump {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
  rm -i "$MARKPATH/$1"
}
function marks {
  mkdir -p "$MARKPATH"; ls -l "$MARKPATH" | tail -n +2 | tr -s ' ' | cut -d' ' -f9- | column -ts' '
}

# Auto-completion for 'jump' and 'unmark' based on ~/.marks contents
_completemarks() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
  COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
  return 0
}
complete -o default -o nospace -F _completemarks jump unmark

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
    # if using sed without -E, use commented version
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/.* (.*)/ \(\1\)/'
}

# Prompt declaration
export PS1="$CYAN\u$BLACK : $BLUE\W$LIGHT_PURPLE\$(git_branch)$RED ∴ $LIGHT_GREY"

########
# PATH #
########

# Homebrew: /usr/local/bin as primary (and include corresponding sbin)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH