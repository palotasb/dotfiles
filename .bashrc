#!/usr/bin/env bash

# Invoked as an interactive shell
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

export HOMECFG="${HOMECFG:-${XDG_CONFIG_HOME:-${HOME?unset}/.config}/homecfg}"
export HOMECFG_SHELL=bash

. "$HOMECFG/common-rc.sh"
. "$HOMECFG/interactive-rc.bash"
. "$HOMECFG/interactive-rc.sh"
