#!/usr/bin/env bash
set -e # ends the program if something goes wrong

numParamsExpected=3

if test $# -lt $numParamsExpected
    then
    echo "Not enough parameters given (was $#)."
fi

if test ! -f "$2"
    then
    echo "Second parameter is not a file."
fi

if test "$1" = "--help" || test "$1" = "-h" || test $# -lt $numParamsExpected || test ! -f "$2"
    then
    echo "=== HELP ==="
    echo "Create a PID using a PIT service endpoint."
    echo "Usage: create_pid.bash \$url \$path_to_json_file"
    exit -1
fi

url=$1
content=$(cat $2)
pid=$3

curl \
    -H "Content-Type: application/json" \
    -X PUT \
    -d "$content" \
    --include \
    $url/api/v1/pit/pid/$pid