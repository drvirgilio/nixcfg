#!/bin/sh

nix-env --profile /nix/var/nix/profiles/system --set ./result
./result/bin/switch-to-configuration switch
