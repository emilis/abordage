#!/bin/sh

### Functions: ----------------------------------------------------------------

install_global() {

    if hash git 2>&-;
    then echo "Git is already installed."
    else
        apt-get install git;
    fi
}

install() {

    if hash git 2>&-;
    then echo "Git is already installed."
    else
        echo "You'll have to install git globally.";
        exit 127;
    fi
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install|install_global) "$1" ;;
    *) exit 127;
esac
