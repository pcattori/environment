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
for file in $HOME/.zsh/tools/*.zsh; do
  source $file
done

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  for file in $HOME/.zsh/linux/*.zsh; do
    source $file
  done
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # MacOS
  for file in $HOME/.zsh/macos/*.zsh; do
    source $file
  done
else
  # Unknown.
  echo "Unrecognized OS: ${OSTYPE}"
fi
