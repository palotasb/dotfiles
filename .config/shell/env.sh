if [ -f ~/.config/shell/env_local.sh ]; then
    source ~/.config/shell/env_local.sh
fi

# $PATH
# =====

path_prepend "$HOME/.local/bin"

# Python
# ======

# Python startup file
# https://docs.python.org/3/using/cmdline.html#envvar-PYTHONSTARTUP
export PYTHONSTARTUP=$HOME/.pythonrc.py

# Requiring an active virtual environment for pip
# https://docs.python-guide.org/dev/pip-virtualenv/#requiring-an-active-virtual-environment-for-pip
export PIP_REQUIRE_VIRTUALENV=true

# Caching packages for future use
# https://docs.python-guide.org/dev/pip-virtualenv/#caching-packages-for-future-use
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Other
# =====

if which vim >/dev/null ; then
    export EDITOR=vim
fi
