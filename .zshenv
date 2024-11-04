#!/usr/bin/env zsh

# Sourced first during zsh startup. Both when login/non-login and when interactive/non-interactive.
# https://zsh.sourceforge.io/Doc/Release/Files.html#Files

export HOMECFG="${HOMECFG:-${XDG_CONFIG_HOME:-${HOME?unset}/.config}/homecfg}"
export HOMECFG_SHELL=zsh

. "$HOMECFG/common-rc.sh"
