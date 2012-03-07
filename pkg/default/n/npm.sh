#!/bin/sh

. include/pkg_manager.sh

### Functions: ----------------------------------------------------------------

is_installed() {

    hash npm 2>&-
    return $?
}

install_global() {

    if is_installed;
    then
        echo "NPM is already installed."
        return 0
    elif [ -z "$pkg_manager" ];
    then
        curl http://npmjs.org/install.sh | sh
    else
        pkg/default/n/nodejs.sh install_global
        install_package npm;
    fi
}

install() {

    if is_installed;
    then echo "NPM is already installed."
    else
        curl http://npmjs.org/install.sh | sh
    fi
}

### Main: ---------------------------------------------------------------------

case "$1" in
    is_installed|install|install_global) "$1" ;;
    *) exit 127 ;;
esac
