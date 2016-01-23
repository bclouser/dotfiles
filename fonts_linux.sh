#!/usr/bin/env bash

function installFonts {
	sudo apt-get install fonts-inconsolata || {
		echo "Installing fonts totally failed"
		exit 1
	}
}
