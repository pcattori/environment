if [[ "$(tput colors)" == "256" ]]; then
    fg[red]=$FG[124]
    fg[blue]=$FG[033]
else
    echo 'colorblind'
fi

# TODO show hostname if connected via ssh
PROMPT="%(?.%{$fg[blue]%}.%{$fg[red]%})❯%f "
