#!/usr/bin/env sh

# Requiring an active virtual environment for pip
# https://docs.python-guide.org/dev/pip-virtualenv/#requiring-an-active-virtual-environment-for-pip
export PIP_REQUIRE_VIRTUALENV=true

# Caching packages for future use
# https://docs.python-guide.org/dev/pip-virtualenv/#caching-packages-for-future-use
export PIP_DOWNLOAD_CACHE="$HOME/.pip/cache"
