#!/usr/bin/env sh

if homecfg-command-exists starship && [ "$HOMECFG_SHELL" = "zsh" -o "$HOMECFG_SHELL" = "bash" ] ; then
    eval "$(starship init $HOMECFG_SHELL)"
fi
