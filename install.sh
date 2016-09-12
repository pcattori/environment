dotfiles=$(pwd)
# vim setup
###########

# cleanup old setup
rm -rf ~/.vim && mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# symlink to repo
cd ~ && ln -sf ${dotfiles}/vimrc ~/.vimrc &> /dev/null && cd -

# get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null

# get colorscheme
git clone https://github.com/tomasr/molokai.git &> /dev/null && \
  mv molokai/colors ~/.vim/colors && \
  rm -rf molokai

# install plugins
vim +PluginInstall +qall

# git setup
###########
cd ~ && ln -sf ${dotfiles}/gitconfig ~/.gitconfig &> /dev/null && cd -

# bash setup
############
cd ~ && ln -sf ${dotfiles}/bash_profile ~/.bash_profile &> /dev/null && cd -

cd ~ && ln -sf ${dotfiles}/bashrc  ~/.bashrc &> /dev/null && cd -

cd ~ && ln -sf ${dotfiles}/alias ~/.alias &> /dev/null && cd -

source ~/.bash_profile
