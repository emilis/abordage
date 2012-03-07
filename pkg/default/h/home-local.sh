#!/bin/sh

### Variables:

dir="$HOME/local";

### Functions:

is_installed() {

    if [ -d "$dir" ];
    then return 0;
    else return 1;
    fi
}

install() {

    if is_installed;
    then
        echo "$dir already exists."
    else
        mkdir "$dir";
    fi
}

### Main:

case "$1" in
    is_installed|install) "$1" ;;
    *) exit 127 ;;
esac
