# adapted from .fzf.zsh

FZF_HOME=~/.fzf
export PATH=${FZF_HOME}/bin:$PATH

# defaults
export FZF_DEFAULT_COMMAND="fd"
export FZF_DEFAULT_OPTS="--extended"
PREVIEW="--height 100% -m --preview-window 'right:50%' --preview 'bat --color=always --style=header,numbers {}'"

# Auto-completion
[[ $- == *i* ]] && source ${FZF_HOME}/shell/completion.zsh 2> /dev/null
export FZF_COMPLETION_OPTS=$PREVIEW

# Key bindings
source ${FZF_HOME}/shell/key-bindings.zsh
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$PREVIEW
export FZF_ALT_C_COMMAND="fd --type d"

# fzf-tab: https://github.com/Aloxaf/fzf-tab/issues/81
zstyle ':completion:*:descriptions' format '[%d]'