# {{{ ls
# Colored ls
alias ls='ls -G'
alias ll='ls -Ghla'
# }}}

alias home='cd ~'
alias up='cd ..'
alias make='make -s'

alias chrome='open -a "Google Chrome"'

alias sed='sed -E'
export GREP_OPTIONS='-E --color=auto'

# Don't store commands prepended with ' ' (space) in history
export HISTCONTROL=ignorespace

alias athena='ssh athena.dialup.mit.edu -l pcattori'

# {{{ Jump command module
# TODO(pcattori): jump to subdir of mark
# Set ~/.marks as metadata dir
export MARKPATH=$HOME/.marks

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
  (t="$(printf "\t")"; cd "$MARKPATH" && stat -f"%N$t%SY" * | column -ts"$t")
}

# Auto-completion for 'jump' and 'unmark' based on ~/.marks contents
_completemarks() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
  COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
  return 0
}
complete -o default -o nospace -F _completemarks jump unmark
# }}}

# {{{ Prompt
# Color definitions for prompt
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
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt declaration
export PS1="$CYAN\u$BLACK : $BLUE\W$LIGHT_PURPLE\$(git_branch)$RED ∴ $LIGHT_GREY"
# }}}

# {{{ PATH
# Homebrew: /usr/local/bin as primary (and include corresponding sbin)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# TODO(pcattori): Not sure if GOROOT and PATH need to be set due to homebrew
# Go
#export GOROOT=$HOME/go
#export PATH=$PATH:$GOROOT/bin
# }}}
