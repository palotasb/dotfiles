#!/bin/bash

# Invoked as an interactive login shell, or with --login
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

if [ -f ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi

. ~/.bashrc
