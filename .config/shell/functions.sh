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
