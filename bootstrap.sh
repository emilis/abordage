#!/bin/sh

### Variables: ----------------------------------------------------------------

DIR="abordage";

### Functions: ----------------------------------------------------------------

is_installed() {

    if [ -d "$DIR" ];
    then return 0;
    else return 1;
    fi
}

command_exists() {

    hash $1 2>&-;
}

git_extract() {
    
    git clone "https://github.com/emilis/abordage.git" "$DIR"
}

tar_extract() {

    tarball="abordage-latest.tar.gz";
    wget -O "$tarball" "https://github.com/emilis/abordage/tarball/master";
    mkdir "$DIR";
    tar --directory="$DIR" --strip-components=1 -xzvf "$tarball";
    echo "\nExtracted into $DIR\n";
}

### Main: ---------------------------------------------------------------------

if is_installed;
then
    echo "Abordage directory already exists.";
elif command_exists git;
then
    git_extract
else
    tar_extract
fi


"$DIR/bin/abordage" setup;

