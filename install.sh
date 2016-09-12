dotfiles=$(pwd)
# vim setup
###########

# cleanup old setup
rm ~/.vimrc
rm -rf ~/.vim && mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# symlink to repo
cd ~ && ln -s ${dotfiles}/vimrc ~/.vimrc && cd -

# get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# get colorscheme
git clone https://github.com/tomasr/molokai.git && \
  mv molokai/colors ~/.vim/colors && \
  rm -rf molokai

# install plugins
vim +PluginInstall +qall

# git setup
###########
rm ~/.gitconfig && cd ~ && ln -s ${dotfiles}/gitconfig ~/.gitconfig && cd -
