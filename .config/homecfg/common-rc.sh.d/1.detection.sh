#!/usr/bin/env sh

homecfg-command-exists() {
    command -v "$1" >/dev/null 2>&1
}
