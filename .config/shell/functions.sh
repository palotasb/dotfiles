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
    git --work-tree $HOME/.dotfiles --git-dir $HOME/.dotfiles/.git ls-files
}

config-backup() {
    config-ls-files | \
        xargs -I FILE sh -c "if [ -f "$HOME/FILE" ]; then echo \"FILE\"; fi" | \
        xargs -I FILE sh -c "DATE=$(date +%Y-%m-%d-%H-%M-%S) ; DIR=./.bak-\$DATE ; mkdir -p \$(dirname \"\$DIR/FILE\") ; cp -a \"$HOME/FILE\" \"\$DIR/FILE\" ; if [ \"$1\" != \"--quiet\" ] ; then echo \"FILE\" ; fi"
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
    xargs -I FILE sh -c "cp -a \"$HOME/.dotfiles/FILE\" \"$HOME/FILE\" ; echo \"FILE\""
}

config-source() {
    if ( echo $0 | grep -qE "(^\-?|/)bash$" ) ; then
        echo source $HOME/.bashrc
        source $HOME/.bashrc
    elif ( echo $0 | grep -qE "(^|/)zsh$" ) ; then
        echo source $HOME/.zshrc
        source $HOME/.zshrc
    else
        exit 1
    fi
}