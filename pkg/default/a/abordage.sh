#!/bin/sh

### Variables: ----------------------------------------------------------------

PREFIX="/usr";
LIB="$PREFIX/lib";
DIR="$LIB/abordage";
BIN="$PREFIX/bin";

### Functions: ----------------------------------------------------------------

install_global() {

    if [ -d "$DIR" ];
    then echo "$DIR already exists.";
    else sudo git clone "https://github.com/emilis/abordage.git" "$DIR";
    fi

    if [ -f "$BIN/arr" ];
    then echo "$BIN/arr already exists.";
    else sudo ln -s "$LIB/abordage/bin/global/arr" "$BIN/arr";
    fi

    if [ -f "$BIN/abordage" ];
    then echo "$BIN/abordage already exists.";
    else sudo ln -s "$LIB/abordage/bin/global/abordage" "$BIN/abordage";
    fi
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global) "$1" ;;
    *) exit 127 ;;
esac
