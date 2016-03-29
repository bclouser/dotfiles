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
echo "Function not yet implemented"
}


function configureSublime {
	USER=$(whoami)
	SUBLIME_PACKAGES_USR_DIR="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
	SUBLIME_SETTINGS_FILENAME="Preferences.sublime-settings"
	SUBLIME_PKG_MNGR_FILENAME="Package Control.sublime-package"
	SUBLIME_PKGS_FILENAME="Package Control.sublime-settings"

	SUBLIME_SETTINGS_FILE="${SUBLIME_PACKAGES_USR_DIR}/Preferences.sublime-settings"
	SUBLIME_PKGS_FILE="${SUBLIME_PACKAGES_USR_DIR}/${SUBLIME_PKGS_FILENAME}"	
	SUBLIME_PKG_MNGR_FILE="${HOME}/Library/Application Support/Sublime Text 3/Installed Packages/${SUBLIME_PKG_MNGR_FILENAME}"

	SUBLIME_CONFIGS_PATH="$(pwd)/sublimeConfigs"

	echo "Sublime Settings file: $SUBLIME_SETTINGS_FILE"
	echo "Sublime Package manager file: $SUBLIME_PKG_MNGR_FILE"

	echo $(ls -l "$SUBLIME_SETTINGS_FILE")


	if [ -h "$SUBLIME_SETTINGS_FILE"  &> /dev/null ] || [ -f "$SUBLIME_SETTINGS_FILE" ];then
		rm "$SUBLIME_SETTINGS_FILE" || {
			echo "Failed to remove $SUBLIME_SETTINGS_FILE, thats bad"
			exit 1
		} 
	else
		echo "Sublime settings file does not exist... yet"
	fi

	# If it exists remove the sublime package manager binary
	if [ -h "$SUBLIME_PKG_MNGR_FILE"  &> /dev/null ] || [ -f "$SUBLIME_PKG_MNGR_FILE" ];then
		rm "$SUBLIME_PKG_MNGR_FILE" || {
			echo "Failed to remove $SUBLIME_PKG_MNGR_FILE, thats bad"
			exit 1
		} 
	else
		echo "Sublime pkg manager file does not exist... yet"
	fi

	# If it exists remove the sublime packages file
	if [ -h "$SUBLIME_PKGS_FILE"  &> /dev/null ] || [ -f "$SUBLIME_PKGS_FILE" ];then
		rm "$SUBLIME_PKGS_FILE" || {
			echo "Failed to remove $SUBLIME_PKGS_FILE, thats bad"
			exit 1
		} 
	else
		echo "Sublime pkg manager file does not exist... yet"
	fi
	

	# Link the sublime settings to our config file...
	ln -s "${SUBLIME_CONFIGS_PATH}/${SUBLIME_SETTINGS_FILENAME}" "$SUBLIME_SETTINGS_FILE"

	# Link the sublime pkg mgr to our binary...
	ln -s "${SUBLIME_CONFIGS_PATH}/${SUBLIME_PKG_MNGR_FILENAME}" "$SUBLIME_PKG_MNGR_FILE"

	# Link the sublime pkgs file to our binary...
	ln -s "${SUBLIME_CONFIGS_PATH}/${SUBLIME_PKGS_FILENAME}" "$SUBLIME_PKGS_FILE"

	
	echo "Adding in custom sublime snippets..."
	SUBLIME_SNIPPETS_DIR=$(pwd)/sublimeSnippets
	files=$( ls  ${SUBLIME_SNIPPETS_DIR})
	for i in $files ; do
		ln -s $"{SUBLIME_PACKAGES_USR_DIR}/${i}" "${SUBLIME_SNIPPETS_DIR}/${i}"||{
			echo "Problem linking ${i}, does it already exist?"
		}		
	done	
}
