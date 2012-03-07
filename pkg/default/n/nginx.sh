#!/bin/sh


. include/pkg_manager.sh

### Functions: ----------------------------------------------------------------

is_installed() {

    hash nginx 2>&-
}


install_global() {

    case "$platform_distro" in
        Ubuntu)
            if [ -z "$platform_codename" ];
            then
                echo "Unknown release codename. Cannot add source repo.";
                return 1;
            else
                add-apt-repository deb http://nginx.org/packages/ubuntu/ "$platform_codename" nginx
                apt-get update
                apt-get install nginx
            fi
            ;;
        *)
            echo "TODO: please add install steps for your distro '$platform_distro'.";
            return 1;
            ;;
    esac
}

### Main: ---------------------------------------------------------------------

case "$1" in
    is_installed|install_global) "$1" ;;
    *) exit 127
esac
