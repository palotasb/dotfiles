#!/usr/bin/env bash

# Invoked as an interactive login shell, or with --login
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

if [ -f "$HOME/.bashrc" ] ; then
    . "$HOME/.bashrc"
fi
