#!/bin/sh

### Functions: ----------------------------------------------------------------

get_pkg_script() {

    name="$1"
    first_char=${name%%${name#?}}

    default_pkg="pkg/default/$first_char/$name.sh"
    private_pkg="pkg/private/$first_char/$name.sh"

    if [ -f "$default_pkg" ]
        then pkg_script="$default_pkg"
    elif [ -f "$private_pkg" ]
        then pkg_script="$private_pkg"
    fi
}

### Main: ---------------------------------------------------------------------

get_pkg_script "$2"

case $1 in

    install)
        "$pkg_script" install;
    ;;

    install-global)
        "$pkg_script" install_global;
    ;;

    *)
        echo "Usage: arr {install|install-global}"
    ;;
esac
