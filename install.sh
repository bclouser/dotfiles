
SMYCK_REPO_DIR="$(pwd)/Smyck-Color-Scheme"

# TODO, This should be able to run on redhat/fedora, debian, and mac os... currently debian specific
export OS=$(uname -s)

if [ "${OS}" == "Linux" ]; then
	echo "Running on Linux"
	source devToolEssentials_linux.sh
	source fonts_linux.sh
	source sublime_linux.sh
	source configs_linux.sh
	
elif [ "${OS}" == "Darwin" ]; then
	echo "Running on Mac Os"
	source devToolEssentials_mac.sh
	source fonts_mac.sh
	source sublime_mac.sh
	source configs_mac.sh
fi

echo ""
echo "Installing essential applications..."
installEssentialApps
echo ""
echo "Installing fonts..."
installFonts
echo ""
echo "Installing sublime plugins..."
installSublimePlugins
echo ""
echo "Configuring Sublime"
configureSublime
echo ""
echo "Configuring dot files..."
setupConfigFiles

echo ""
echo "Done"
echo ""


