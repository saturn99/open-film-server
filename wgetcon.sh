#!/bin/bash
s=${1:?"set $1"}
wget --no-check-certificate -N -e robots=off -A "*.html" -r -l 0 -p --convert-links --no-parent "$@"

