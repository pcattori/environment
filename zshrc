source ~/.zsh/zplug.zsh

source ~/.zsh/aliases.zsh
source ~/.zsh/history.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/prompt.zsh

export EDITOR=vim
export PATH=~/.bin:$PATH

# load all files from ~/.zshrc.d directory
for file in $HOME/.zsh/tools/*.zsh; do
  source $file
done
