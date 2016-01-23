#!/usr/bin/env bash


function installEssentialApps {
	sudo apt-get install -y vim || {echo "Failed to install vim"}
}
