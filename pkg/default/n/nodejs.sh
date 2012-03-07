#!/bin/sh

. include/pkg_manager.sh

### Functions: ----------------------------------------------------------------

install_global() {
    
    # Dependencies:
    pkg/default/p/python-software-properties.sh install_global;

    # Installation:
    case "$pkg_manager" in
        apt-get)
            add-apt-repository ppa:chris-lea/node.js;
            apt-get update;
            apt-get install nodejs;
            ;;
        *)
            echo "No instructions on how to install nodejs under '$pkg_manager' package manager."
            return 1
            ;;
    esac
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global) "$1" ;;
    *)  echo "Command $0 $1 is not supported." ;;
esac
