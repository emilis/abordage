#!/bin/sh

### Functions: ----------------------------------------------------------------

install() {
    echo "Unsupported install type (local) for $0.";
    exit 127;
}

install_global() {
    sudo apt-get install python-software-properties
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global) "$1" ;;
    *)  echo "Command $0 $1 is not supported." ;;
esac
