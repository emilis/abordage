#!/bin/sh

### Functions: ----------------------------------------------------------------

install_global() {

    pkg/default/n/nodejs.sh install_global
    sudo apt-get install npm;
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global) "$1" ;;
    *)  echo "Command $0 $1 is not supported." ;;
esac
