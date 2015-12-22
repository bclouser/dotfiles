#!/usr/bin/env bash

function installFonts {
	echo ""
	echo "Installing fonts..."
	sudo apt-get install fonts-inconsolata || {
		echo "Installing fonts totally failed"
		exit 1
	}
}
