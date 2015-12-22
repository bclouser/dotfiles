
SMYCK_REPO_DIR="$(pwd)/Smyck-Color-Scheme"


mkdir -p ~/.vim/colors

ln -s $SMYCK_REPO_DIR/smyck.vim ~/.vim/colors/smyck.vim




# Create symlinks for rc files

#ln -s $(pwd)/vimrc ~/.vimrc
# Not sure this is such a good idea with bashrc
#ln -s $(pwd)/bashrc ~/.bashrc
#ln -s $(pwd)/bash_profile ~/.bash_profile

