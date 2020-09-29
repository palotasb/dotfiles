# Use colors in coreutils utilities output

# Disabled: Does not work on Mac OS X
# alias ls='ls --color=auto'
export CLICOLOR=1
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
