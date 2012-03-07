#!/bin/sh

. include/platform.sh

### Functions: ----------------------------------------------------------------

install_package() {

    if [ -z "$1" ];
    then
        echo "Usage: install_package PKG_NAME";
        return 1;
    elif [ -z "$platform_pkg_manager" ];
    then
        echo "Package manager not detected."
        return 1;
    else
        "$platform_pkg_manager" install "$1"
    fi
}


### Main: ---------------------------------------------------------------------

if [ $(basename "$0") = "pkg_manager.sh" ];
then
    case "$1" in
        install|install-package)
            install_package "$2"
            ;;
    esac
fi
