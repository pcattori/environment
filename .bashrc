# Colored ls
alias ls='ls -G'

# Jump command module
export MARKPATH=$HOME/.marks
function jump { 
  cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
  mkdir -p $MARKPATH; ln -s "$(pwd)" $MARKPATH/$1
}
function unmark { 
  rm -i $MARKPATH/$1 
}
function marks {
  ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/	-/g' && echo
}

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

# Prompt
export PS1="$CYAN\u$BLACK :: $BLUE\W$LIGHT_PURPLE\$(git_branch)$RED ∴ $LIGHT_GREY"

# Controlled environment for "Practical Vim" book & exercises
alias evim='vim -u ~/Desktop/Projects/Learning/vim/practical_vim_examples/code/essential.vim'

# Go
#export GOROOT=$HOME/go
#export PATH=$PATH:$GOROOT/bin

# Ruby ... ?
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Heroku ... ?
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
