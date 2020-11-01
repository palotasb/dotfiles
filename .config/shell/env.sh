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
# Disabled because it complains when installing inside a Conda env
# export PIP_REQUIRE_VIRTUALENV=true

# Caching packages for future use
# https://docs.python-guide.org/dev/pip-virtualenv/#caching-packages-for-future-use
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Other
# =====

# Preferred editor: vim
if which vim >/dev/null ; then
    export EDITOR=vim
fi

# Allow control chars (colors) to pass thru
export LESS=-R

# Docker-machine on Mac
if which docker-machine >/dev/null 2>&1; then
    [ "$DEBUG" != "" ] && echo "docker-machine exists, getting status"
    if [ "$(docker-machine status 2>/dev/null)" = "Running" ] ; then
        [ "$DEBUG" != "" ] && echo "docker-machine status running, setting env"
        eval $(docker-machine env)
    fi
fi
