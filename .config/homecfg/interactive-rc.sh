#!/usr/bin/env sh

rcfiles="$(for rcfile in "$HOMECFG/interactive-rc.sh.d"/* ; do echo "$rcfile"; done | sort)"

while read -r rcfile ; do
    . "$rcfile"
done <<EOF
$rcfiles
EOF
