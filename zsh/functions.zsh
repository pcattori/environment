function extract {
    echo Extracting $1 ...
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)    tar xjf $1;;
            *.tar.gz)     tar xzf $1;;
            *.bz2)        bunzip2 $1;;
            *.rar)        unrar x $1;;
            *.gz)         gunzip $1;;
            *.tar)        tar xf $1;;
            *.tbz2)       tar xjf $1;;
            *.tgz)        tar xzf $1;;
            *.zip)        unzip $1;;
            *.Z)          uncompress $1;;
            *.7z)        	7z x $1;;
            *)			echo "'$1' cannot be extracted via extract";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function trash {
    local path
    for path in "$@"; do
        # ignore any arguments
        if [[ "$path" = -* ]]; then :
        else
            local dst=${path##*/}
            # append the time if necessary
            while [ -e ~/.Trash/"$dst" ]; do
                dst="$dst "$(date +%H-%M-%S)
            done
            /bin/mv "$path" ~/.Trash/"$dst"
        fi
    done
}

function in {
    (cd ${1} && shift && ${@})
}