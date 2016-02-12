#!/usr/bin/env bash


function installEssentialApps {
	sudo apt-get install -y vim || {echo "Failed to install vim"}

	sudo apt-get install -y terminator || {echo "Failed to install terminator"}
	
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get install sublime-text-installer
}
