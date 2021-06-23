#!/usr/bin/env bash
set -e # ends the program if something goes wrong

if test $# -lt 2
    then
    echo "Not enough parameters given (was $#)."
fi

if test ! -f "$2"
    then
    echo "Second parameter is not a file."
fi

if test "$1" = "--help" || test "$1" = "-h" || test $# -lt 2 || test ! -f "$2"
    then
    echo "=== HELP ==="
    echo "Create a PID using a PIT service endpoint."
    echo "Usage: create_pid.bash \$url \$path_to_json_file"
    exit -1
fi

content=$(cat $2)
url=$1

curl \
    -H "Content-Type: application/json" \
    -X POST \
    -d "$content" \
    $url/api/v1/pit/pid/