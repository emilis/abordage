#!/bin/sh

### Functions: ----------------------------------------------------------------

setup_private() {

    if [ -d "pkg/private" ];
    then echo "Private repo already set-up";
    else
        curdir=`pwd -P`;
        cd pkg
        git clone "$1" private
        cd "$curdir";
    fi
}


update() {

    git pull
    
    if [ -d "pkg/private" ];
    then
        curdir=`pwd -P`;
        cd pkg/private;
        git pull
        cd "$curdir";
    fi
}

### Main: ---------------------------------------------------------------------

case "$1" in
    setup)
        echo "Congratulations on installing Abordage!";
        echo "Usage: bin/arr {install|install-global} PACKAGE";
        ;;
    setup-private)
        setup_private "$2"
        ;;
    update)
        update
        ;;
    *)
        echo "Abordage repository management is not yet working."
    ;;
esac
