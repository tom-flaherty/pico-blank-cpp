{
  description = "Dependencies for developing for the pico with C or CPP";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells.${system}.default =
      # Note that pkgs.mkshell automatically adds some dev packages such as make
      pkgs.mkShell
        {
          buildInputs = [
            pkgs.libgcc
            pkgs.cmake
            pkgs.gcc-arm-embedded
            pkgs.picotool
            pkgs.minicom
          ];

          shellHook = ''
            export CC=$(which arm-none-eabi-gcc)
            export CXX=$(which arm-none-eabi-g++)
            echo "Cross‑toolchain ready: $CC"
          '';
        };
  };
}
