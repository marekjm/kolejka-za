#!/usr/bin/env sh

set -e

DO_GDANSKA=/tmp/kolejka-do-gdanska.html
DO_GDYNI=/tmp/kolejka-do-gdyni.html

wget -O $DO_GDANSKA 'http://skm.trojmiasto.pl/rozklad/?from=5918&to=7500' &>/dev/null
wget -O $DO_GDYNI 'http://skm.trojmiasto.pl/rozklad/?from=5918&to=5900' &>/dev/null

FIRST_GDANSK=$(grep -aP 'class="no-print">\d+ min' $DO_GDANSKA | grep -Po '\d+ min')
FIRST_GDYNIA=$(grep -aP 'class="no-print">\d+ min' $DO_GDYNI | grep -Po '\d+ min')

if [[ $1 == '--three' || $1 == '-3' ]]; then
    NEXT_GDANSK=$(grep -aP '\d+ min, +\d+ min' $DO_GDANSKA | grep -Po '\d+ min, +\d+ min' | awk '{ print $1 " " $2 " " $3 " " $4 }')
    NEXT_GDYNIA=$(grep -aP '\d+ min, +\d+ min' $DO_GDYNI | grep -Po '\d+ min, +\d+ min' | awk '{ print $1 " " $2 " " $3 " " $4 }')
fi

if [[ $1 == '--three' || $1 == '-3' ]]; then
    echo "→ Gdańsk $FIRST_GDANSK, $NEXT_GDANSK / → Gdynia $FIRST_GDYNIA, $NEXT_GDYNIA"
else
    echo "→ Gdańsk $FIRST_GDANSK / → Gdynia $FIRST_GDYNIA"
fi
