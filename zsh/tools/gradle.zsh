# gradlew from anywhere
function gw () {
    dirpath=$(pwd)
    while [ ! -f "${dirpath}/gradlew" ]; do
        if [ "$dirpath" "==" "/" ]; then
            echo "Couldn't find gradlew - hit / so giving up"
            return 1
        else
            dirpath=$(dirname $dirpath)
        fi
    done
 
    if [ -f "${dirpath}/gradlew" ]; then
        # "${dirpath}/gradlew" --configure-on-demand "$@"
        "${dirpath}/gradlew" "$@"
    fi
}