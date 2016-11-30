dotfiles=$(pwd)
# vim setup
###########

# cleanup old setup
rm -rf ~/.vim && mkdir -p ~/.vim

# symlink to repo
cd ~ && ln -sf ${dotfiles}/vimrc ~/.vimrc &> /dev/null && cd -

# get vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +PlugInstall +qall

# git setup
###########
cd ~ && ln -sf ${dotfiles}/gitconfig ~/.gitconfig &> /dev/null && cd -

# bash setup
############
cd ~ && ln -sf ${dotfiles}/bash_profile ~/.bash_profile &> /dev/null && cd -

cd ~ && ln -sf ${dotfiles}/bashrc  ~/.bashrc &> /dev/null && cd -

cd ~ && ln -sf ${dotfiles}/alias ~/.alias &> /dev/null && cd -

source ~/.bash_profile
