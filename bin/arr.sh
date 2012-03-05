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

if [ -z "$pkg_script" -o ! -f "$pkg_script"];
then
    echo "The script $pkg_script for the package $2 does not exist."
    exit 127;
fi

case $1 in

    install|install-local)
        "$pkg_script" install;
    ;;

    install-global)
        if [ $(id -u) -ne 0 ];
        then 
            echo "Root privileges required for \"install-global\" task."
            echo "Please try \"sudo $0 $@\"";
            exit 126;
        else
            "$pkg_script" install_global;
        fi
    ;;

    *)
        echo "Usage: arr {install|install-global}"
    ;;
esac
