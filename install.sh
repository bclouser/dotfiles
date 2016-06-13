#!/usr/bin/env bash

SMYCK_REPO_DIR="$(pwd)/Smyck-Color-Scheme"
SUBLIME_DIR="$(pwd)/sublime"

# TODO, This should be able to run on redhat/fedora, debian, and mac os... currently debian specific
export OS=$(uname -s)

if [ "${OS}" == "Linux" ]; then
	echo "Running on Linux"
	source devToolEssentials_linux.sh
	source fonts_linux.sh
	source "${SUBLIME_DIR}/sublime_linux_vars.sh"
	source configs_linux.sh
	
elif [ "${OS}" == "Darwin" ]; then
	echo "Running on Mac Os"
	source devToolEssentials_mac.sh
	source fonts_mac.sh
	source "${SUBLIME_DIR}/sublime_mac_vars.sh"
	source configs_mac.sh
fi


# General install for sublime, this is platform agnostic using vars sourced above
source "${SUBLIME_DIR}/sublimeInstall.sh"

# I always forget to clone --recursive so i figured i would just add these here.
git submodule init
git submodule update

echo ""
echo "======== Installing essential applications... ========"
echo ""
installEssentialApps
echo ""
echo "======== Installing fonts... ========"
echo ""
installFonts
echo ""
echo "======== Configuring Sublime... ========"
echo ""
configureSublime
echo ""
echo "======== Configuring dot files... ========"
echo ""
setupConfigFiles

echo ""
echo "======== Asking for you to set editor of choice ======="
sudo update-alternatives --config editor

echo ""
echo "======== Setting kdiff3 as the default mergetool ======="
git config --global merge.tool kdiff3

echo ""
echo "======== Done ========"
echo ""


