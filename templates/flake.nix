{
  description = "Personal flake for bevy engine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      libs = with pkgs; [
        wayland
        libX11
        libXcursor
        libXi
        libXrandr
        libxkbcommon

        # Audio
        alsa-lib
        systemd

        mesa
        libglvnd
        vulkan-loader
      ];
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.pkg-config ] ++ libs;

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath libs;

        shellHook = ''
          export CARGO_TARGET_DIR=$PWD/target
        '';
      };

    };
}
