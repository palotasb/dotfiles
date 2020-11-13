#!/usr/bin/env sh

if [ -f ~/.config/shell/aliases_local.sh ]; then
    . ~/.config/shell/aliases_local.sh
fi

# Use colors in coreutils utilities output
alias ls='ls --color=auto'  # disabled in local override for Mac OS X
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

if [ -f ~/.config/shell/aliases_override.sh ]; then
    . ~/.config/shell/aliases_override.sh
fi
