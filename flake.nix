{
  description = "Flake wrapper for ejovo repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    libejovo.url = "github:ejovo13/libejovo";
  };

  outputs = {
    self,
    nixpkgs,
    libejovo,
  }: let
    fehWrapper = import ./default.nix {pkgs = import nixpkgs {system = "x86_64-linux";};};
  in {
    packages.x86_64-linux = {
      fehWrapper = fehWrapper;
      libejovo = libejovo.packages.x86_64-linux.default;
    };
  };
}
