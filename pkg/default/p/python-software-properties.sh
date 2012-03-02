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

"$1";
