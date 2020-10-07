HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE

shopt -s histappend # append to history file

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Completion
# brew install bash-completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

