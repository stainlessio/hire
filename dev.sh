#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
. ${ROOT}/common.sh
cd ${ROOT}
trap 'kill %1' SIGINT
hugo server ${HUGO_DEV_OPTS} & sass --watch ${SASS_SOURCE}:${SASS_DESTINTATION} ${SASS_OPTS}
