#!/bin/sh

### Variables:

dir="$HOME/local";

### Functions:

is_installed() {

    test -d "$dir"
    return $?
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
