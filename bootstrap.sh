#!/bin/sh

TARBALL="$HOME/abordage-latest.tar.gz";
DIR="$HOME/abordage";

cd "$HOME";

wget -O "$TARBALL" https://github.com/emilis/abordage/tarball/master;

tar xzvf "$TARBALL";

cd "$DIR";

. bin/abordage setup;

