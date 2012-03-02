#!/bin/sh

### Functions: ----------------------------------------------------------------

install_global() {

    if hash npm 2>&-;
    then echo "NPM is already installed."
    else
        pkg/default/n/nodejs.sh install_global
        sudo apt-get install npm;
    fi
}

install() {

    if hash npm 2>&-;
    then echo "NPM is already installed."
    else
        curl http://npmjs.org/install.sh | sh
    fi
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install|install_global) "$1" ;;
    *)  echo "Command $0 $1 is not supported." ;;
esac
