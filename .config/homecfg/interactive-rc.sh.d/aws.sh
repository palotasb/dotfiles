#!/usr/bin/env sh

export AWS_CONFIG_FILE="$HOME/.config/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.cache/.aws/credentials"

if ! homecfg-command-exists aws ; then
    return
fi

complete -C "$(command -v aws_completer)" aws
