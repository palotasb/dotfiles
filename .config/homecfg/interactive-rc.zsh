#!/usr/bin/env zsh

# Initialize completion
autoload -Uz compinit && compinit -i
autoload -Uz bashcompinit && bashcompinit
zstyle ':completion:*' menu select=4
zmodload zsh/complist

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# Use incremental search
bindkey "^R" history-incremental-search-backward

