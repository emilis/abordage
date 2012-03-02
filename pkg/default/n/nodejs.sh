#!/bin/sh

### Functions: ----------------------------------------------------------------

install_global() {
    
    # Dependencies:
    pkg/python-software-properties.sh install_global;

    # Installation:
    sudo add-apt-repository ppa:chris-lea/node.js;
    sudo apt-get update;
    sudo apt-get install nodejs;
}

### Main: ---------------------------------------------------------------------

"$1";
