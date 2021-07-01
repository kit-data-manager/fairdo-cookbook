#!/usr/bin/env bash
set -e # ends the program if something goes wrong

if test $# -lt 2
    then
    echo "Not enough parameters given (was $#)."
fi

if test "$1" = "--help" || test "$1" = "-h" || test $# -lt 2
    then
    echo "=== HELP ==="
    echo "Resolve a PID using a PIT service endpoint."
    echo "Usage: resolve_pid.bash \$url \$pid"
    exit -1
fi

url=$1
pid=$2

curl \
    -H "Content-Type: application/json" \
    -X GET \
    -d "$content" \
    --include
    $url/api/v1/pit/pid/$pid