#!/usr/bin/env bash


function installEssentialApps {
	
	xcode-select --install

	# Install Brew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || {
		echo "Installing brew seems to have failed"
	}

	brew install the_silver_searcher
}
