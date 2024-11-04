#!/usr/bin/env zsh

# Sourced after .zshenv during zsh interactive startup.
# https://zsh.sourceforge.io/Doc/Release/Files.html#Files

export HOMECFG="${HOMECFG:-${XDG_CONFIG_HOME:-${HOME?unset}/.config}/homecfg}"
export HOMECFG_SHELL=zsh

. "$HOMECFG/interactive-rc.zsh"
. "$HOMECFG/interactive-rc.sh"
