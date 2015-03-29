if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/jump-module.bash ]; then
  . $(brew --prefix)/etc/jump-module.bash
fi
