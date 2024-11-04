#!/usr/bin/env sh

echorun() {
    green="$(tput setaf 2 || printf '')"
    reset="$(tput sgr0 || printf '')"
    echo "${green}$@${reset}" >&2;
    "$@";
}
