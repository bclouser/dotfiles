#!/usr/bin/env bash


function setupConfigFiles {

# Install smyck vim color scheme
mkdir -p ${HOME}/.vim/colors

ln -s $SMYCK_REPO_DIR/smyck.vim ${HOME}/.vim/colors/smyck.vim || {
 echo "failed to add smyck.vim to vim"
}

# Terminator config file
mkdir -p ${HOME}/.config/terminator

ln -s $(pwd)/terminator-config ${HOME}/.config/terminator/config || {
 echo "Failed to link terminator config"
}

# Create symlinks for rc files
ln -s $(pwd)/vimrc ${HOME}/.vimrc || {
 echo "Failed to link vimrc"
}

# Append the consoleString... Hmm, dangerous to do more than once
# The first line must be unique. Should be some comment
FIRST_LINE=$(head -n 1 ./bash_addons_generic)
# Search for first line of our custom bashrc in the existing bashrc
grep "$FIRST_LINE" ${HOME}/.bashrc 

# if exit status is not 0, it doesn't already exist in bashrc
if [ "$?" -ne 0 ];then
	echo "" >> ${HOME}/.bashrc
	echo "" >> ${HOME}/.bashrc
	echo "" >> ${HOME}/.bashrc
	cat ./bash_addons_generic >> ${HOME}/.bashrc
	echo "" >> ${HOME}/.bashrc
fi

# Configure cron jobs
$(pwd)/installCronJobs.sh

}
