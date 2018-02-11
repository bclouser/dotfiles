#!/usr/bin/env bash


function installEssentialApps {
	sudo apt-get install -y vim || {echo "Failed to install vim"}

	sudo apt-get install -y terminator || {echo "Failed to install terminator"}
	
	sudo apt-get install -y curl || {echo "Failed to install curl"}
	
	# Sublime text 3
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	sudo apt-get install apt-transport-https
	# Currently using stable, could use dev... meh
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt-get update
	sudo apt-get install sublime-text
	sudo apt-get install silversearcher-ag
}
