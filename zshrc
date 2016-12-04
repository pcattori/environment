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

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/settings.zsh
