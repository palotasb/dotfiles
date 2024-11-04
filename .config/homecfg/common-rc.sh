#!/usr/bin/env sh

rcfiles="$(for rcfile in "$HOMECFG/common-rc.sh.d"/* ; do echo "$rcfile"; done | sort)"

while read -r rcfile ; do
    . "$rcfile"
done <<EOF
$rcfiles
EOF
