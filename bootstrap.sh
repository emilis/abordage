#!/bin/sh

### Variables: ----------------------------------------------------------------

DIR="$HOME/abordage";

### Functions: ----------------------------------------------------------------

command_exists() {
    
    hash $1 2>&-;
}

git_extract() {
    
    git clone "https://emilis@github.com/emilis/abordage.git" "$DIR"
}

tar_extract() {

    tarball="$HOME/abordage-latest.tar.gz";
    wget -O "$tarball" "https://github.com/emilis/abordage/tarball/master";
    tar xzvf "$tarball";
}

### Main: ---------------------------------------------------------------------

cd "$HOME";

if command_exists git;
    then git_extract
    else tar_extract
fi

cd "$DIR";

. bin/abordage setup;

