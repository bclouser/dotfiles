
SMYCK_REPO_DIR="$(pwd)/Smyck-Color-Scheme"

# TODO, This should be able to run on redhat/fedora, debian, and mac os... currently debian specific


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

mkdir -p ${HOME}/.vim/colors

# Install smyck vim color scheme
ln -s $SMYCK_REPO_DIR/smyck.vim ${HOME}/.vim/colors/smyck.vim || {
 echo "failed to add smyck.vim to vim"
}

# Terminator config file
ln -s $(pwd)/terminator-config ${HOME}/.config/terminator/config || {
 echo "Failed to link terminator config"
}

# Create symlinks for rc files
ln -s $(pwd)/vimrc ${HOME}/.vimrc || {
 echo "Failed to link vimrc"
}

# Append the consoleString... Hmm, dangerous to do more than once
cat ./bashrc_addons >> ${HOME}/.bashrc
echo "" >> ${HOME}/.bashrc

echo ""
echo "Done"
echo ""


