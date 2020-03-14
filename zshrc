source ~/.zsh/zplug.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh

export EDITOR=vim

export HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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

# load all files from ~/.zshrc.d directory
if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/tools/*.zsh; do
    source $file
  done
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -d $HOME/.zsh/linux ]; then
    for file in $HOME/.zsh/linux/*.zsh; do
      source $file
    done
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # MacOS
  if [ -d $HOME/.zsh/macos ]; then
    for file in $HOME/.zsh/macos/*.zsh; do
      source $file
    done
  fi
else
  # Unknown.
  echo "Unrecognized OS: ${OSTYPE}"
fi
