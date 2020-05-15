#!/usr/bin/env bash

############################
# Developed for Ubuntu 18.04
############################

sudo apt update

# zsh
sudo apt install -y zsh
echo "Changing default shell to ZSH will require your password"
chsh -s $(which zsh)

# pyenv: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt-get install -y --no-install-recommends \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

# fd: https://github.com/sharkdp/fd#on-ubuntu
wget https://github.com/sharkdp/fd/releases/download/v8.0.0/fd-musl_8.0.0_amd64.deb
sudo dpkg -i fd-musl_8.0.0_amd64.deb 
rm fd-musl_8.0.0_amd64.deb
