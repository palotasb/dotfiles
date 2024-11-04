#!/usr/bin/env sh

_homecfg="$(command -v homecfg)"
homecfg() {
    # push new _HOMECFG_CMDS file on the stack
    _homecfg_cmds="${_homecfg_cmds:-}:$(mktemp)"
    
    # run the requested command
    env _HOMECFG_CMDS="${_homecfg_cmds##*:}" "$_homecfg" "$@"

    # push the exit code on the stack
    _homecfg_exit="${_homecfg_exit:-}:$?"

    # get the last item in the stack by ignoring the longest "*:" prefix
    if [ -f "${_homecfg_cmds##*:}" ] ; then
        # IMPORTANT: In the following line, sourcing arbitrary additional commands
        # could invoke this homecfg() function again. This requires homecfg() to be
        # reentrant. But all the variables are global scoped! To avoid clobbering
        # them, homecfg() must take care to restore all variables to their previous
        # values. This is done by treating all variables as a stack. New values to
        # the variables (_homecfg_cmds, _homecfg_exit) are pushed to the stack and
        # then popped before the homecfg() function returns, leaving the variables
        # intact and making this function reentrant. The "${_homecfg_cmds##*:}"
        # expression cannot be refactored into a separate variable because that
        # variable itself would also be global and it would be clobbered.
        # shellcheck source=/dev/null
        . "${_homecfg_cmds##*:}" # Note: this could clobber *any* variable we use.
        rm "${_homecfg_cmds##*:}"
    fi

    # get the last item in the stack by ignoring the longest "*:" prefix 
    # (nothing runs after this, so clobbering/reentrancy is not a concern)
    _homecfg_last_exit="${_homecfg_exit##*:}"

    # restore the stack variables before returning
    # pop the last item from the list by removing the shortest ":*" suffix
    _homecfg_cmds="${_homecfg_cmds%:*}" 
    _homecfg_exit="${_homecfg_exit%:*}"

    return "$_homecfg_last_exit"
}
