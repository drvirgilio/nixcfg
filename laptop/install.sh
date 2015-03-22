#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export NIXOS_CONFIG=$DIR/configuration.nix

nixos-rebuild $*

