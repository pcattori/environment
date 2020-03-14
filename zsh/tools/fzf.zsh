# adapted from .fzf.zsh

FZF_HOME=~/.fzf

# Generate fzf binary
${FZF_HOME}/install --bin &> /dev/null

export PATH=${FZF_HOME}/bin:$PATH

# Auto-completion
[[ $- == *i* ]] && source ${FZF_HOME}/shell/completion.zsh 2> /dev/null

# Key bindings
source ${FZF_HOME}/shell/key-bindings.zsh

export FZF_DEFAULT_OPTS="--extended"
