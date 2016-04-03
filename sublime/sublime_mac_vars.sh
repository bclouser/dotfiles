#!/usr/bin/env bash

export USER=$(whoami)

export SUBLIME_SETTINGS_FILENAME="Preferences.sublime-settings"
export SUBLIME_PKG_MNGR_FILENAME="Package Control.sublime-package"
export SUBLIME_PKGS_FILENAME="Package Control.sublime-settings"

export SUBLIME_PACKAGES_USR_DIR="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
export SUBLIME_SETTINGS_FILE="${SUBLIME_PACKAGES_USR_DIR}/Preferences.sublime-settings"
export SUBLIME_PKGS_FILE="${SUBLIME_PACKAGES_USR_DIR}/${SUBLIME_PKGS_FILENAME}"	
export SUBLIME_PKG_MNGR_FILE="${HOME}/Library/Application Support/Sublime Text 3/Installed Packages/${SUBLIME_PKG_MNGR_FILENAME}"


