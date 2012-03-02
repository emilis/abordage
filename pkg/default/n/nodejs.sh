#!/bin/sh

### Functions: ----------------------------------------------------------------

install_global() {
    
    # Dependencies:
    pkg/default/p/python-software-properties.sh install_global;

    # Installation:
    sudo add-apt-repository ppa:chris-lea/node.js;
    sudo apt-get update;
    sudo apt-get install nodejs;
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install_global) "$1" ;;
    *)  echo "Command $0 $1 is not supported." ;;
esac
