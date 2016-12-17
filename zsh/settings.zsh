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

PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH