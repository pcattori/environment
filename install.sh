dotfiles=$(pwd)
# vim setup
###########

# cleanup old setup
rm -rf ~/.vim && mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# symlink to repo
cd ~ && ln -sF ${dotfiles}/vimrc ~/.vimrc > /dev/null && cd -

# get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null

# get colorscheme
git clone https://github.com/tomasr/molokai.git > /dev/null && \
  mv molokai/colors ~/.vim/colors && \
  rm -rf molokai

# install plugins
vim +PluginInstall +qall

# git setup
###########
cd ~ && ln -sF ${dotfiles}/gitconfig ~/.gitconfig > /dev/null && cd -

# bash setup
############
cd ~ && ln -sF ${dotfiles}/bash_profile ~/.bash_profile > /dev/null && cd -

cd ~ && ln -sF ${dotfiles}/bashrc  ~/.bashrc > /dev/null && cd -

cd ~ && ln -sF ${dotfiles}/alias ~/.alias > /dev/null && cd -

source ~/.bash_profile
