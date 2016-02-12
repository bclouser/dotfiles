#!/usr/bin/env bash

# TODO figure out how to install these
function installSublimePlugins {

#modific /*git tracking and shows diffs with ctrl-alt-d*/
#text-pastry /*useful commands for incrementing multiple selection etc.*/
#SideBarEnhancements /* Most useful for "show in dir" */
#BracketHighlighter
#jquery
#html5 
#monokai extended /* color scheme*/
#SodaReloaded Theme
echo "Function not currently implemented"
}


function configureSublime {
	SUBLIME_PACKAGES_USR_DIR="${HOME}/.config/sublime-text-3/Packages/User"
	SUBLIME_SETTINGS_FILE="${SUBLIME_PACKAGES_USR_DIR}/Preferences.sublime-settings"	
	echo $SUBLIME_SETTINGS_FILE
	mkdir -p $SUBLIME_PACKAGES_USR_DIR	

	echo $(ls -l $SUBLIME_SETTINGS_FILE)
	# Check if regular file or if symbolic link
	if [ -h $SUBLIME_SETTINGS_FILE ];then
		echo "THe file is a link, no doubt"
	fi


	if [ -h $SUBLIME_SETTINGS_FILE ] || [ -f $SUBLIME_SETTINGS_FILE ];then
		rm $SUBLIME_SETTINGS_FILE || {
			echo "Failed to remove $SUBLIME_SETTINGS_FILE, thats bad"
			exit 1
		} 
	else
		echo "Sublime settings file does not exist"
	fi

	# Link the sublime settings to our config file...
	ln -s $(pwd)/Preferences.sublime-settings $SUBLIME_SETTINGS_FILE

	
	echo "Adding in custom sublime snippets..."
	SUBLIME_SNIPPETS_DIR=$(pwd)/sublimeSnippets
	files=$( ls  ${SUBLIME_SNIPPETS_DIR})
	for i in $files ; do
		ln -s ${SUBLIME_PACKAGES_USR_DIR}/${i} ${SUBLIME_SNIPPETS_DIR}/${i}||{
			echo "Problem linking ${i}, does it already exist?"
		}		
	done	
}
