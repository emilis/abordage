#!/bin/sh

### Functions: ----------------------------------------------------------------

get_pkg_script() {

    name="$1"
    first_char=${name%%${name#?}}

    default_pkg="pkg/default/$first_char/$name.sh"
    private_pkg="pkg/private/$first_char/$name.sh"

    if [ -z "$name" ];
        then
            echo "Please supply a package name." >&2;
            return 1;
    elif [ -f "$private_pkg" ]
        then pkg_script="$private_pkg"
    elif [ -f "$default_pkg" ]
        then pkg_script="$default_pkg"
    else
        echo "The script file for the package $name does not exits." >&2;
        exit 127;
    fi
}

check_task_status() {

    case $1 in
        127)
            echo "The package does not support task $2." >&2;
            ;;
        0)
            ;;
        *)
            echo "An error occured while installing your package." >&2;
            ;;
    esac
}

search_packages() {

    if [ -z "$1" ];
    then pattern='*.sh';
    else pattern="*$1*.sh";
    fi

    find pkg/ \
        -type f \
        -name "$pattern" \
        -printf '%f\b\b\b   \n' | sort
}

### Main: ---------------------------------------------------------------------



case $1 in

    install|install-local)
        get_pkg_script "$2"
        "$pkg_script" install;
        check_task_status $? install
    ;;

    install-global)
        if [ $(id -u) -ne 0 ];
        then 
            echo "Root privileges required for \"install-global\" task." >&2;
            echo "Please try \"sudo $0 $@\"" >&2;
            exit 126;
        else
            get_pkg_script "$2"
            "$pkg_script" install_global;
            check_task_status $? install_global
        fi
    ;;

    list|search)
        search_packages "$2"
        ;;

    *)
        echo "Usage: arr {install|install-global}"
    ;;
esac
