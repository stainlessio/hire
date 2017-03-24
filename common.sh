#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export SASS_SOURCE="${ROOT}/themes/resume/static/sass"
export SASS_DESTINATION="${ROOT}/themes/resume/static/css"
export SASS_COMMON_OPTS="--scss --unix-newlines -l -g"
export HUGO_DEV_OPTS="server --bind 0.0.0.0 -D -E -F --enableGitInfo --pluralizeListTitles=false"
