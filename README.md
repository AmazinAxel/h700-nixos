# NixOS for H700

Forked from [Alpine H700](https://github.com/mporrato/alpine-h700)

Intended for use in Anbernic RG35XX-H devices but can be used on any H700 device

## Build

Get devshell: `nix-shell -p gnumake python3 libguestfs gptfdisk fakeroot podman abootimg`

Upload stock Anbernic image as factory.img in root

Run `make`
