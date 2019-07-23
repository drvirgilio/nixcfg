nixos-config
============

My configuration files for my NixOS machines.

Information about NixOS can be found [here](https://nixos.org/)

## Build Instructions

Inspired by http://www.haskellforall.com/2018/08/nixos-in-production.html

### Checkout git submodule

```sh

```

### Build

```sh
> cd ./devices/laptop0
> nix build
```

### Copy to another machine using SSH

```sh
> nix copy --to "${USER}@${MACHINE}" ./result
```

### Copy to another machine using files

```sh
> nix copy --to 'file:///path/to/usb/drive' ./result    # build machine
> nix copy --from 'file:///path/to/usb/drive' ./result  # destination machine
```

### Activate

```sh
> nix-env --profile /nix/var/nix/profiles/system --set ./result
> ./result/bin/switch-to-configuration [ switch | boot | test | dry-run ]

```

## Adding a new configuration

Put `configuration.nix` into a new directory and copy `default.nix` and `nixos.nix` into that directory.
Add git submodule for nixpkgs.

```sh
> git submodule add -b nixos-unstable --depth 1 https://github.com/NixOS/nixpkgs-channels.git nixpkgs
```

