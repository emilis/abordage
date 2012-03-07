#!/bin/sh


. include/pkg_manager.sh

### Functions: ----------------------------------------------------------------

install() {

    echo "Unsupported install type (local) for $0.";
    exit 127;
}

install_global() {

    install_package python-software-properties
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global) "$1" ;;
    *) exit 127 ;;
esac
