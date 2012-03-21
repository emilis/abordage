#!/bin/sh

### Includes: -----------------------------------------------------------------

. include/pkg_manager.sh

### Functions: ----------------------------------------------------------------

link() {

    if [ -z "$1" -o -z "$2" -o -z "$3" ];
    then
        echo "ERROR: emilis-config.sh:link() needs three arguments." >&2;
        echo "You gave: '$1', '$2', '$3'." >&2;
        exit 1;
    fi

    s="$1/$3";
    t="$2/$3";

    if [ ! -f "$s" -a ! -d "$s" ];
    then echo "Source file $s does not exist." >&2;
    elif [ -f "$t" -o -d "$t" -o -L "$t" ];
    then echo "Target file $t already exists.";
    else
        ln -s "$s" "$t";
    fi
}

install() {

    # Dependencies:
    install_command git git;

    if [ -z "$target_dir" ]; then target_dir="."; fi
    DIR="$target_dir/emilis-config";

    # Install:
    if [ -d "$DIR" ];
    then echo "emilis-config directory already exists.";
    else
        git clone "git://github.com/emilis/emilis-config.git" "$DIR";
    fi

    if [ -z "$nolink" ];
    then
        link "$DIR" "$target_dir"   ".vimrc";
        link "$DIR" "$target_dir"   ".vim";
        link "$DIR" "$target_dir"   ".bash_aliases";
        link "$DIR" "$target_dir"   ".bash_ps1";
        link "$DIR" "$target_dir"   ".bashrc";
        link "$DIR" "$target_dir"   ".inputrc";
    fi
}

install_global() {

    # install into /usr/share:
    target_dir="/usr/share";
    export nolink="true";
    install;
}

### Main: ---------------------------------------------------------------------

case "$1" in
    install|install_global) "$1" ;;
    *)
        "Command $0 $1 does not exist";
        exit 127
        ;;
esac
