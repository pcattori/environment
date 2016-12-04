# initialize zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
export PS1="Z > " # fallback

# let zplug manage itself
zplug "zplug/zplug"
zplug update --self

# completion
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions" # fish-style auto-suggestions

# other
zplug "lib/spectrum", from:oh-my-zsh # colors
zplug "Valiev/almostontop" # auto `clear`
zplug "plugins/wd", from:oh-my-zsh # new `jump`
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# bindings/settings
###################

# tab menu traversal
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

bindkey "^R" history-incremental-pattern-search-backward

# emacs-style editing on cli
bindkey -e

# aliases
#########

alias ls='ls -GFh'
alias ll='ls -GFhl'
alias zshrc="$EDITOR ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"
alias colors='spectrum_ls'

# options
#########

export EDITOR=vim

export HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# TODO maybe use default logging, but custom up-arrow searching?
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# functions
###########

function extract {
    echo Extracting $1 ...
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)    tar xjf $1;;
            *.tar.gz)     tar xzf $1;;
            *.bz2)        bunzip2 $1;;
            *.rar)        unrar x $1;;
            *.gz)         gunzip $1;;
            *.tar)        tar xf $1;;
            *.tbz2)       tar xjf $1;;
            *.tgz)        tar xzf $1;;
            *.zip)        unzip $1;;
            *.Z)          uncompress $1;;
            *.7z)        	7z x $1;;
            *)			echo "'$1' cannot be extracted via extract";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function trash {
    local path
    for path in "$@"; do
        # ignore any arguments
        if [[ "$path" = -* ]]; then :
        else
            local dst=${path##*/}
            # append the time if necessary
            while [ -e ~/.Trash/"$dst" ]; do
                dst="$dst "$(date +%H-%M-%S)
            done
            /bin/mv "$path" ~/.Trash/"$dst"
        fi
    done
}

# prompt
########

if [[ "$(tput colors)" == "256" ]]; then
    fg[red]=$FG[124]
    fg[blue]=$FG[033]
else
    echo 'colorblind'
fi

# TODO show hostname if connected via ssh
PROMPT="%(?.%{$fg[blue]%}.%{$fg[red]%})❯%f "
