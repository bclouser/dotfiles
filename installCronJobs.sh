#!/usr/bin/env bash

# add job that updates that calls background script at 3AM every monday and thursday
(crontab -l 2>/dev/null; echo "0 3 * * 1,4 /bin/bash /home/bclouser/dotfiles/updateBackground.sh") | crontab -

