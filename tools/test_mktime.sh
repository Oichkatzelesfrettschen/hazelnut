#!/bin/sh
set -e
cd "$(dirname "$0")"
make clean >/dev/null
make >/dev/null
./mktime >/dev/null
