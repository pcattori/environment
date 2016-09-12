# vim setup
###########

# cleanup old setup
rm ~/.vimrc
rm -rf ~/.vim && mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# symlink to repo
cwd=$(pwd)
cd ~ && ln -s ${cwd}/vimrc ~/.vimrc && cd -

# get Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# get colorscheme
git clone https://github.com/tomasr/molokai.git && \
  mv molokai/colors ~/.vim/colors && \
  rm -rf molokai

# install plugins
vim +PluginInstall +qall
