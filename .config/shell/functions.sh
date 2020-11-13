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

config() {
    git --git-dir="$HOME/.dotfiles$DOTFILES/.git" --work-tree="$HOME" "$@"
}

config-repo() {
    git --git-dir="$HOME/.dotfiles$DOTFILES/.git" --work-tree="$HOME/.dotfiles$DOTFILES/" "$@"
}

config-setup() {
    _DOTFILES="$DOTFILES"
    DOTFILES_REPO="$1"
    DOTFILES_BRANCH="$2"
    DOTFILES="-$DOTFILES_BRANCH"
    git clone "$DOTFILES_REPO" --branch "$DOTFILES_BRANCH" "$HOME/.dotfiles$DOTFILES"
    config config status.showUntrackedFiles no
    config-backup
    config-sync
    config-source
    DOTFILES="$_DOTFILES"
}

config-backup() {
    timestamp=$(date +%Y-%m-%d-%H-%M-%S)
    dir="$HOME/.dotfiles${DOTFILES}/.bak-${timestamp}"
    files=$(config-repo ls-files | xargs -I % echo %)
    files=$(echo "${files}" | xargs -I  __F sh -c "if [ -f \"$HOME/__F\" ]; then echo \"__F\"; fi")
    echo "${files}" | xargs -I __F echo "${dir}/__F" | xargs -I __F mkdir -p __F
    echo "${files}" | xargs -I __F cp -a "$HOME/__F" "${dir}/__F"
    if [ "$1" != --quiet ] ; then
        echo "${files}"
    fi
    unset files ; unset dir ; unset timestamp
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
    config-repo ls-files | \
    xargs -I __F sh -c "cp -a \"$HOME/.dotfiles${DOTFILES}/__F\" \"$HOME/__F\" ; echo \"__F\""
}

config-source() {
    if ( echo $0 | grep -qE "(^\-?|/)bash$" ) ; then
        echo . $HOME/.bashrc
        . $HOME/.bashrc
    elif ( echo $0 | grep -qE "(^\-?|/)zsh$" ) ; then
        echo . $HOME/.zshrc
        . $HOME/.zshrc
    else
        exit 1
    fi
}
