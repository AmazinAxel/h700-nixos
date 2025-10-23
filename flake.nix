{
  description = "devshell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gnumake
            python3
            libguestfs-with-appliance
            gptfdisk
            fakeroot
            podman
            abootimg
            #busybox
            #bash
          ];

          shellHook = ''
            export LIBGUESTFS_PATH="${pkgs.libguestfs-with-appliance}/lib/guestfs"
            export LIBGUESTFS_DEBUG=1
            export LIBGUESTFS_TRACE=1
          '';
        };
      });
}
