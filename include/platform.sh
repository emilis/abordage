#!/bin/sh

##
#   Creates variables with platform details:
#
#   - platform_os           Linux / ?
#   - platform_machine      x86_64 / i686 / ...
#   - platform_distro       Ubuntu / CentOS / Debian / ...
#   - platform_release      X.Y
#   - platform_codename     oneiric / natty / ...
#   - platform_pkg_manager  apt-get / yum
#

export platform_os=$(uname -s); # "Linux";
export platform_machine=$(uname -m); # "x86_64" / "i686"


if [ -f /etc/lsb-release ];
then
    . /etc/lsb-release
    export platform_distro="$DISTRIB_ID";
    export platform_release="$DISTRIB_RELEASE";
    export platform_codename="$DISTRIB_CODENAME";
elif [ -f /etc/issue ];
then
    export platform_distro=$(grep -oE '^\S+' /etc/issue);
    export platform_release=$(grep -oE '[0-9.]+' /etc/issue);
    export platform_codename="";
else
    export platform_distro="";
    export platform_release="";
    export platform_codename="";
fi


case "$platform_distro" in
    Ubuntu|Debian)
        export platform_pkg_manager="apt-get"
        ;;
    CentOS)
        export platform_pkg_manager="yum"
        ;;
    *)
        export platform_pkg_manager=""
        ;;
esac

