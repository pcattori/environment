# initialize zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
export PS1="Z > " # fallback

# let zplug manage itself
zplug "zplug/zplug"
zplug update --self

# completion
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"

# other
zplug "Valiev/almostontop"
zplug "plugins/wd", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# theme
zplug "themes/pure", from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# tab menu traversal
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

# emacs-style editing on cli
bindkey -e

alias ls='ls -G'
