#!/usr/bin/env sh

homecfg-path-append() {
    export PATH="${PATH:+$PATH:}$1"
}

homecfg-path-prepend() {
    export PATH="$1${PATH:+:$PATH}"
}

if [ -d "$HOMECFG/bin" ] ; then
    homecfg-path-prepend "$HOMECFG/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
    homecfg-path-prepend "$HOME/.local/bin"
fi

if [ -d "$HOME/bin" ] ; then
    homecfg-path-prepend "$HOME/bin"
fi
