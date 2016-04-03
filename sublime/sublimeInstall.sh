#!/usr/bin/env bash

# This is platform independent, this should run on all systems!
# Variables in here should be defined elsewhere to accomodate the platform
# IF I ever have to care about windows... this could get interesting

# These vars are for our local file tree
SUBLIME_CONFIGS_PATH="$(pwd)"
SUBLIME_SNIPPETS_DIR="$(pwd)/snippets"

function configureSublime {
	echo "#### Sublime Configuration Vars ####"
	echo "    USER = ${USER}"
	echo "    SUBLIME_SETTINGS_FILENAME = ${SUBLIME_SETTINGS_FILENAME}"
	echo "    SUBLIME_PKG_MNGR_FILENAME = ${SUBLIME_PKG_MNGR_FILENAME}"
	echo "    SUBLIME_PKGS_FILENAME = ${SUBLIME_PKGS_FILENAME}"
	echo "    SUBLIME_PACKAGES_USR_DIR = ${SUBLIME_PACKAGES_USR_DIR}"
	echo "    SUBLIME_SETTINGS_FILE = ${SUBLIME_SETTINGS_FILE}"
	echo "    SUBLIME_PKGS_FILE = ${SUBLIME_PKGS_FILE}"
	echo "    SUBLIME_PKG_MNGR_FILE = ${SUBLIME_PKG_MNGR_FILE}"
	echo ""
	echo ""

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
	files=$( ls  ${SUBLIME_SNIPPETS_DIR})
	for i in $files ; do
		ln -s $"{SUBLIME_PACKAGES_USR_DIR}/${i}" "${SUBLIME_SNIPPETS_DIR}/${i}"||{
			echo "Problem linking ${i}, does it already exist?"
		}		
	done	
}