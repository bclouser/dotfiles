#!/usr/bin/env bash

# TODO figure out how to install these
function installSublimePlugins {
	echo ""
	echo "Installing sublime plugins..."
#modific /*git tracking and shows diffs with ctrl-alt-d*/
#text-pastry /*useful commands for incrementing multiple selection etc.*/
#SideBarEnhancements /* Most useful for "show in dir" */
#BracketHighlighter
#jquery
#html5 
#monokai extended /* color scheme*/
#SodaReloaded Theme
}


function configureSublime {
	echo ""
	echo "Configuring Sublime Text..."
	SUBLIME_SETTINGS_FILE="~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"	

	if [ -f $SUBLIME_SETTINGS_FILE ];then
		rm $SUBLIME_SETTINGS_FILE || {
			echo "Failed to remove $SUBLIME_SETTINGS_FILE, thats bad"
			exit 1
		} 
	fi

	# Link the sublime settings to our config file...
	ln -s $(pwd)/Preferences.sublime-settings $SUBLIME_SETTINGS_FILE
}
