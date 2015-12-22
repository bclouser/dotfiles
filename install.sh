
SMYCK_REPO_DIR="$(pwd)/Smyck-Color-Scheme"


source devToolEssentials.sh
source fonts.sh
source sublime.sh


installEssentialApps
installFonts
installSublimePlugins
configureSublime


########################################################
# Take care of setting up configs
########################################################

echo ""
echo "Configuring dot files..."

mkdir -p ~/.vim/colors

# Install smyck vim color scheme
ln -s $SMYCK_REPO_DIR/smyck.vim ~/.vim/colors/smyck.vim || {
 echo "failed to add smyck.vim to vim"
}

# Terminator config file
ln -s $(pwd)/terminator-config ~/.config/terminator/config || {
 echo "Failed to link terminator config"
}

# Create symlinks for rc files
ln -s $(pwd)/vimrc ~/.vimrc || {
 echo "Failed to link vimrc"
}

#ln -s $(pwd)/bashrc ~/.bashrc

ln -s $(pwd)/bash_profile ~/.bash_profile || {
 echo "Failed to link bash_profile"
}


echo ""
echo "Done"
echo ""


