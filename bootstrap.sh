#!/bin/sh

### Variables: ----------------------------------------------------------------

DIR="abordage";

### Functions: ----------------------------------------------------------------

command_exists() {
    
    hash $1 2>&-;
}

git_extract() {
    
    git clone "https://github.com/emilis/abordage.git" "$DIR"
}

tar_extract() {

    tarball="abordage-latest.tar.gz";
    wget -O "$tarball" "https://github.com/emilis/abordage/tarball/master";
    tar xzvf "$tarball";
}

### Main: ---------------------------------------------------------------------

if command_exists git;
    then git_extract
    else tar_extract
fi

cd "$DIR";
echo $(pwd -P);

bin/abordage.sh setup;

