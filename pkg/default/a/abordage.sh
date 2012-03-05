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

    . pkg/default/g/git.sh install_global

    if [ -z "$PREFIX" ]; then   PREFIX="/usr"; fi
    if [ -z "$DIR" ]; then      DIR="$PREFIX/lib/abordage"; fi
    if [ -z "$BIN" ]; then      BIN="$PREFIX/bin"; fi

    _install_tasks
}

install() {

    . pkg/default/g/git.sh install
    . pkg/default/h/home-bin.sh install

    if [ -z "$PREFIX" ]; then   PREFIX="$HOME/local"; fi
    if [ -z "$DIR" ]; then      DIR="$PREFIX/abordage"; fi
    if [ -z "$BIN" ]; then      BIN="$HOME/bin"; fi

    _install_tasks
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install|install_global) "$1" ;;
    *) exit 127 ;;
esac
