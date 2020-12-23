# https://developer.bring.com/blog/configuring-jenv-the-right-way/

# sdkman
export SDKMAN_DIR=$HOME/.sdkman
source $HOME/.sdkman/bin/sdkman-init.sh

# jenv
export PATH=$HOME/.jenv/bin:$PATH
eval "$(jenv init -)"