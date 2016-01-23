#!/usr/bin/env bash


function setupConfigFiles {

mkdir -p ${HOME}/.vim/colors

# Install smyck vim color scheme
ln -s $SMYCK_REPO_DIR/smyck.vim ${HOME}/.vim/colors/smyck.vim || {
 echo "failed to add smyck.vim to vim"
}

# iterm2 config file
#ln -s $(pwd)/terminator-config ${HOME}/.config/terminator/config || {
# echo "Failed to link terminator config"
#}

# Create symlinks for rc files
ln -s $(pwd)/vimrc ${HOME}/.vimrc || {
 echo "Failed to link vimrc"
}

# Append the consoleString... Hmm, dangerous to do more than once
# The first line must be unique. Should be some comment
FIRST_LINE=$(head -n 1 ./bash_addons)
# Search for first line of our custom bashrc in the existing bashrc
grep "$FIRST_LINE" ${HOME}/.profile

# if exit status is not 0, it doesn't already exist in bashrc
if [ "$?" -ne 0 ];then
	cat ./bash_addons >> ${HOME}/.profile
	echo "" >> ${HOME}/.profile
else
	echo "First line found in .profile, not appending bash_addons"
fi

}
