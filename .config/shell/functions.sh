#!/usr/bin/env sh

# PATH

path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

# no_proxy

no_proxy_remove() {
    no_proxy=$(echo -n "$no_proxy" | awk -v RS=, -v ORS=, "\$0 != \"$1\"" | sed 's/,$//')
}

no_proxy_append() {
    no_proxy_remove "$1"
    no_proxy="${no_proxy:+"$no_proxy,"}$1"
}

no_proxy_prepend() {
    no_proxy_remove "$1"
    no_proxy="$1${no_proxy:+",$no_proxy"}"
}

# Git-based .dotfiles

config-ls-files() {
    git --work-tree "$HOME/.dotfiles${DOTFILES}" --git-dir "$HOME/.dotfiles${DOTFILES}/.git" ls-files
}

config-backup() {
    __DF_DATE=$(date +%Y-%m-%d-%H-%M-%S)
    __DF_DIR="$HOME/.dotfiles${DOTFILES}/.bak-${__DF_DATE}"
    __DF_FILES="$(config-ls-files)"
    __DF_FILES=$(echo ${__DF_FILES} | xargs -I __F sh -c "if [ -f "$HOME/__F" ]; then echo \"__F\"; fi")
    echo ${__DF_FILES} | xargs -I __F echo "${__DF_DIR}/__F" | xargs -I __F mkdir -p __F
    echo ${__DF_FILES} | xargs -I __F cp -a "$HOME/__F" "${__DF_DIR}/__F"
    if [ "$1" != --quiet ] ; then
        echo ${__DF_FILES}
    fi
    unset __DF_FILES ; unset __DF_DIR ; unset __DF_DATE
}

config-reset() {
    if [ "$1" != "--no-backup" ] ; then
        config-backup
    fi
    config reset --hard
}

config-sync() {
    if [ "$1" != "--no-backup" ] ; then
        config-backup --quiet
    fi
    config-ls-files | \
    xargs -I __F sh -c "cp -a \"$HOME/.dotfiles${DOTFILES}/__F\" \"$HOME/__F\" ; echo \"__F\""
}

config-source-shell() {
    if ( echo $1 | grep -qE "(^\-?|/)bash$" ) ; then
        echo . $HOME/.bashrc
        . $HOME/.bashrc
    elif ( echo $1 | grep -qE "(^\-?|/)zsh$" ) ; then
        echo . $HOME/.zshrc
        . $HOME/.zshrc
    else
        exit 1
    fi
}