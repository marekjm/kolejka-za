#!/usr/bin/env sh

set -e

wget -O /tmp/kolejka.html 'http://skm.trojmiasto.pl/rozklad/?from=5918&to=7500' &>/dev/null

FIRST=$(grep -aP 'class="no-print">\d+ min' /tmp/kolejka.html | grep -Po '\d+ min')

if [[ $1 == '--three' ]]; then
    NEXT=$(grep -aP '\d+ min, +\d+ min' /tmp/kolejka.html | grep -Po '\d+ min, +\d+ min' | awk '{ print $1 " " $2 " " $3 " " $4 }')
fi

if [[ $1 == '--three' ]]; then
    echo "$FIRST, $NEXT"
else
    echo "$FIRST"
fi
