# emacs-style editing by default
bindkey -e

# vi-style editing with <CTRL-x><CTRL-e>
autoload edit-command-line; zle -N edit-command-line
bindkey "^X^E" edit-command-line
