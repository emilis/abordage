#!/bin/sh

### Main: ---------------------------------------------------------------------

case "$1" in
    setup)
        echo "Congratulations on installing Abordage!";
        echo "Usage: bin/arr {install|install-global} PACKAGE";
        ;;
    *)
        echo "Abordage repository management is not yet working."
    ;;
esac
