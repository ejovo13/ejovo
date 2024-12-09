{
  description = "Flake wrapper for ejovo repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    libejovo.url = "github:ejovo13/libejovo";
    image-to-ascii.url = "github:ejovo13/image-to-ascii";
  };

  outputs = {
    self,
    nixpkgs,
    libejovo,
    image-to-ascii,
  }: let
    # TODO: Move this elsewhere
    fehWrapper = import ./default.nix {pkgs = import nixpkgs {system = "x86_64-linux";};};
    # cmakeWrapper = import ./cmakeWrapper.nix {pkgs = import nixpkgs {system = "x86_64-linux";};};
  in {
    packages.x86_64-linux = {
      fehWrapper = fehWrapper;
      libejovo = libejovo.packages.x86_64-linux.default;
      image-to-ascii = image-to-ascii.x86_64-linux.default;
      # cmakeWrapper = cmakeWrapper;
    };
  };
}
