#!/bin/sh

### Functions: ----------------------------------------------------------------

install_global() {

    "pkg/nodejs.sh" install_global
    sudo apt-get install npm;
}

### Main: ---------------------------------------------------------------------

"$1";
