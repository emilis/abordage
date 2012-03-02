#!/bin/sh

### Functions: ----------------------------------------------------------------

test_exists() {

    hash jake 2>&-
}

install() {

    if test_exists;
    then echo "Jake is already installed."
    else
        pkg/default/n/npm.sh install
        pkg/default/h/home-bin.sh install
        
        npm install jake
        ln -s "$HOME/node_modules/jake/bin/cli.js" "$HOME/bin"
    fi
}

install_global() {

    if test_exists;
    then echo "Jake is already installed."
    else
        pkg/default/n/npm.sh install_global
        
        npm install -g jake
    fi
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global|install) "$1" ;;
    *) exit 127 ;;
esac
