#!/bin/sh


### Functions: ----------------------------------------------------------------

install_package() {

    if [ -z "$1" ];
    then
        echo "Usage: install_package PKG_NAME";
        return 1;
    elif [ -z "$pkg_manager" ];
    then
        echo "Package manager not detected."
        return 1;
    else
        "$pkg_manager" install "$1"
    fi
}


### Main: ---------------------------------------------------------------------

if [ -z "$platform_distro" ];
then . include/platform.sh
fi

case "$platform_distro" in
    Ubuntu|Debian)
        export pkg_manager="apt-get"
        ;;
    CentOS)
        export pkg_manager="yum"
        ;;
    *)
        export pkg_manager=""
        ;;
esac

if [ $(basename "$0") = "pkg_manager.sh" ];
then
    case "$1" in
        install|install-package)
            install_package "$2"
            ;;
    esac
fi
