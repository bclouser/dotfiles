#!/usr/bin/env bash


function installEssentialApps {
	echo ""
	echo "Installing essential applications..."

	sudo apt-get install -y vim || {echo "Failed to install vim"}

}
