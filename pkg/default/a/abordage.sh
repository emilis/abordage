#!/bin/sh

### Functions: ----------------------------------------------------------------

_install_tasks() {

    if [ -d "$DIR" ];
    then echo "$DIR already exists.";
    else git clone "https://github.com/emilis/abordage.git" "$DIR";
    fi

    if [ -f "$BIN/arr" ];
    then echo "$BIN/arr already exists.";
    else ln -s "$DIR/bin/arr" "$BIN/arr";
    fi

    if [ -f "$BIN/abordage" ];
    then echo "$BIN/abordage already exists.";
    else ln -s "$DIR/bin/abordage" "$BIN/abordage";
    fi
}

install_global() {

    PREFIX="/usr";
    LIB="$PREFIX/lib";
    DIR="$LIB/abordage";
    BIN="$PREFIX/bin";

    sudo _install_tasks
}

install() {

    . pkg/default/h/home-bin.sh install

    PREFIX="$HOME/local";
    DIR="$PREFIX/abordage";
    BIN="$HOME/bin";

    _install_tasks
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install|install_global) "$1" ;;
    *) exit 127 ;;
esac
