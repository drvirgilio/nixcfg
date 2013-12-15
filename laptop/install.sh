#!/bin/sh
# This script is used to copy the config files and install
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -r $DIR/* /etc/nixos/
nixos-rebuild $*

