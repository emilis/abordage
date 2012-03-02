#!/bin/sh

### Variables:

dir="$HOME/bin";

### Functions:

install() {

    if [ -d "$dir" ];
    then echo "$dir already exists."
    else
        mkdir "$dir";
    fi

    test_script='PATH="$HOME/bin:$PATH"'
    profile_script=$(cat <<'eofscript'
        #set PATH so it includes users private bin if it exists
        if [-d "$HOME/bin" ];
        then PATH="$HOME/bin:$PATH"
        fi
eofscript
        );

    if [ -f "$HOME/.profile" ];
    then
        if grep "$test_script" "$HOME/.profile" > /dev/null;
        then echo "PATH is already set-up."
        else echo "$profile_script" >> "$HOME/.profile"
        fi
    elif [ -f "$HOME/.bash_profile" ];
    then
        if grep "$test_script" "$HOME/.bash_profile" > /dev/null;
        then echo "PATH is already set-up."
        else echo "$profile_script" >> "$HOME/.bash_profile"
        fi
    elif [ -f "$HOME/.bashrc" ];
    then
        if grep "$test_script" "$HOME/.bashrc" > /dev/null;
        then echo "PATH is already set-up."
        else echo "$profile_script" >> "$HOME/.bashrc"
        fi
    fi
}

### Main:

case "$1" in
    install) "$1" ;;
    *) exit 127 ;;
esac
